// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'now_playing_movies_cubit.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesLoaded extends NowPlayingMoviesState {
  final List<MovieModel> movies;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const NowPlayingMoviesLoaded({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  NowPlayingMoviesLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return NowPlayingMoviesLoaded(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage, isLoading];
}

class NowPlayingMoviesFailed extends NowPlayingMoviesState {
  final String message;
  const NowPlayingMoviesFailed({
    required this.message,
  });
}
