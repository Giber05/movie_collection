// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<MovieModel> movies;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const SearchMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  SearchMoviesLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return SearchMoviesLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage, isLoading];
}

class SearchMoviesFailed extends SearchMoviesState {
  final String message;

  const SearchMoviesFailed({required this.message});

}
