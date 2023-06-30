// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

class HomeMoviesModel extends Equatable {
  final List<MovieModel> popularMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> upcomingMovies;
  final List<MovieModel> topRatedMovies;
  const HomeMoviesModel({
    required this.popularMovies,
    required this.nowPlayingMovies,
    required this.upcomingMovies,
    required this.topRatedMovies,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [popularMovies,nowPlayingMovies, upcomingMovies, topRatedMovies];
}
