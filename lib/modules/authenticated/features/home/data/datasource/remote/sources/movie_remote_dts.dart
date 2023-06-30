import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

abstract class MovieRemoteDts {
    Future<APIResult<Paginated<List<MovieModel>>>> getPopularMovies(
      {required int page, required String token});
    Future<APIResult<Paginated<List<MovieModel>>>> getTopRatedMovies(
      {required int page, required String token});
    Future<APIResult<Paginated<List<MovieModel>>>> getUpcommingMovies(
      {required int page, required String token});
    Future<APIResult<Paginated<List<MovieModel>>>> getNowPlayingMovies(
      {required int page, required String token});
}