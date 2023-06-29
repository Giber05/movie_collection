// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<MovieModel> movies;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const PopularMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  PopularMoviesLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return PopularMoviesLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage, isLoading];
}

class PopularMoviesFailed extends PopularMoviesState {
  final String message;
  const PopularMoviesFailed({
    required this.message,
  });
}
