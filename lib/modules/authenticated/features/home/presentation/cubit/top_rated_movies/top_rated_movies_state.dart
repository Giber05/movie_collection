// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<MovieModel> movies;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const TopRatedMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  TopRatedMoviesLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return TopRatedMoviesLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage, isLoading];
}

class TopRatedMoviesFailed extends TopRatedMoviesState {
  final String message;
  const TopRatedMoviesFailed({
    required this.message,
  });
}
