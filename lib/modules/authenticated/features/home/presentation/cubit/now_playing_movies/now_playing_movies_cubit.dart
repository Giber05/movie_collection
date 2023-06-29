// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';

import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_popular_movies.dart';

part 'now_playing_movies_state.dart';

@injectable
class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(
    this._getNowPlayingMovies,
  ) : super(NowPlayingMoviesInitial());

  final GetNowPlayingMovies _getNowPlayingMovies;

  void getMoreNowPlayingMovies() async {
    final currentState = state;
    if (currentState is NowPlayingMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getNowPlayingMovies(
        GetNowPlayingMoviesParams(
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
            emit(NowPlayingMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(NowPlayingMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void getNowPlayingMovies(
      ) async {
    emit(NowPlayingMoviesLoading());
    final usecaseCall = await _getNowPlayingMovies(GetNowPlayingMoviesParams(token: NetworkConstants.token, page: 1)
    );
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(NowPlayingMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(NowPlayingMoviesFailed(message: exception.message));
      },
    );
  }
}
