import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';
import 'package:movie_collection/modules/authenticated/features/search/domain/usecases/search_movies.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

part 'search_state.dart';

@injectable
class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit(this._searchMovies) : super(SearchMoviesInitial());

  final SearchMovies _searchMovies;

  void getMoreMovies(String keyword) async {
    final currentState = state;
    if (currentState is SearchMoviesLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _searchMovies(
        SearchMoviesParams(
            page: currentState.currentPage + 1,
            token: NetworkConstants.token,
            keyword: keyword),
      );
      useCaseCall.when(
        success: (data) {
          final newMovies = data.data;
          if (newMovies.isEmpty) {
            emit(currentState.copyWith(hasReachedMax: true, isLoading: false));
          } else {
            final newData = currentState.movies + newMovies;
            emit(SearchMoviesLoaded(
              movies: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(SearchMoviesFailed(message: exception.message));
        },
      );
    }
  }

  void searchMovies(String keyword) async {
    emit(SearchMoviesLoading());
    final usecaseCall = await _searchMovies(SearchMoviesParams(
        token: NetworkConstants.token, page: 1, keyword: keyword));
    usecaseCall.when(
      success: (data) {
        final movies = data.data;
        final currentPage = data.current;
        emit(SearchMoviesLoaded(
          isLoading: false,
          movies: movies,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(SearchMoviesFailed(message: exception.message));
      },
    );
  }
}
