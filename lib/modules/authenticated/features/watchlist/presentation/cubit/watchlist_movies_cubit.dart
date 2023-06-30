import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/domain/usecases/get_watchlist_movies.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

part 'watchlist_movies_state.dart';

@injectable
class WatchlistMoviesCubit extends Cubit<WatchlistMoviesState> {
  WatchlistMoviesCubit(this._getWatchlistMovies) : super(WatchlistMoviesInitial());
  final GetWatchlistMovies _getWatchlistMovies;
  void getMoreWatchlistMovies() async {
    final currentState = state;
    if (currentState is WatchlistMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getWatchlistMovies(
        GetWatchlistMoviesParams(
          page: currentState.currentPage + 1,
          token: NetworkConstants.token,
          accountId: NetworkConstants.accountId
        ),
      );
      useCaseCall.when(
        success: (data) {
          final newMovies = data.data;
          if (newMovies.isEmpty) {
            emit(currentState.copyWith(hasReachedMax: true, isLoading: false));
          } else {
            final newData = currentState.movies + newMovies;
            emit(WatchlistMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(WatchlistMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void getWatchlistMovies() async {
    emit(WatchlistMoviesLoading());
    final usecaseCall = await _getWatchlistMovies(
        GetWatchlistMoviesParams(token: NetworkConstants.token, page: 1, accountId: NetworkConstants.accountId));
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(WatchlistMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(WatchlistMoviesFailed(message: exception.message));
      },
    );
  }
}
