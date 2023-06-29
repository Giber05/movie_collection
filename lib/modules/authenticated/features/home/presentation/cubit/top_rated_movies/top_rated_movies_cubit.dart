// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';

import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_state.dart';

@injectable
class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(
    this._getTopRatedMovies,
  ) : super(TopRatedMoviesInitial());

  final GetTopRatedMovies _getTopRatedMovies;

  void getMoreTopRatedMovies() async {
    final currentState = state;
    if (currentState is TopRatedMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getTopRatedMovies(
        GetTopRatedMoviesParams(
          page: currentState.currentPage + 1,
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
            emit(TopRatedMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(TopRatedMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final usecaseCall = await _getTopRatedMovies(
        GetTopRatedMoviesParams(token: NetworkConstants.token, page: 1));
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(TopRatedMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(TopRatedMoviesFailed(message: exception.message));
      },
    );
  }
}
