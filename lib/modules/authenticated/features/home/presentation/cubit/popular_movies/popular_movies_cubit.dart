// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';

import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_popular_movies.dart';

part 'popular_movies_state.dart';

@injectable
class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(
    this._getPopularMovies,
  ) : super(PopularMoviesInitial());

  final GetPopularMovies _getPopularMovies;

  void getMorePopularMovies() async {
    final currentState = state;
    if (currentState is PopularMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getPopularMovies(
        GetPopularMoviesParams(
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
            emit(PopularMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(PopularMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void getPopularMovies(
      ) async {
    emit(PopularMoviesLoading());
    final usecaseCall = await _getPopularMovies(GetPopularMoviesParams(token: NetworkConstants.token, page: 1)
    );
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(PopularMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(PopularMoviesFailed(message: exception.message));
      },
    );
  }
}
