// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'upcoming_movies_cubit.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<MovieModel> movies;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const UpcomingMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  UpcomingMoviesLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return UpcomingMoviesLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage, isLoading];
}

class UpcomingMoviesFailed extends UpcomingMoviesState {
  final String message;
  const UpcomingMoviesFailed({
    required this.message,
  });
}
