import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/home_movies_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';

abstract class MovieRepo {
      Future<Result<Paginated<List<MovieModel>>>> getPopularMovies(
      {required int page, required String token});
    Future<Result<Paginated<List<MovieModel>>>> getTopRatedMovies(
      {required int page, required String token});
    Future<Result<Paginated<List<MovieModel>>>> getUpcommingMovies(
      {required int page, required String token});
    Future<Result<Paginated<List<MovieModel>>>> getNowPlayingMovies(
      {required int page, required String token});
    Future<Result<HomeMoviesModel>> getHomeMovies(
      {required int page, required String token});
}