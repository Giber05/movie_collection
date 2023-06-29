// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';

import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_upcoming_movies.dart';

part 'upcoming_movies_state.dart';

@injectable
class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit(
    this._getUpcomingMovies,
  ) : super(UpcomingMoviesInitial());

  final GetUpcomingMovies _getUpcomingMovies;

  void getMoreUpcomingMovies() async {
    final currentState = state;
    if (currentState is UpcomingMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getUpcomingMovies(
        GetUpcomingMoviesParams(
         page: currentState.currentPage+1,
          token: NetworkConstants.token,
        ),
      );
      useCaseCall.when(
        success: (data) {
          final newMovies = data.data;
          if (newMovies.isEmpty) {
            emit(currentState.copyWith(hasReachedMax: true, isLoading: false));
          } else {
            final newData = currentState.movies + newMovies;
            emit(UpcomingMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(UpcomingMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void getUpcomingMovies(
      ) async {
    emit(UpcomingMoviesLoading());
    final usecaseCall = await _getUpcomingMovies(GetUpcomingMoviesParams(token: NetworkConstants.token, page: 1)
    );
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(UpcomingMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(UpcomingMoviesFailed(message: exception.message));
      },
    );
  }
}
