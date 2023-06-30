import 'package:movie_collection/infrastructure/types/nothing/nothing.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';

abstract class MovieDetailRepo {
  Future<Result<MovieDetailModel>> getMovieDetail(
      {required int movieId, required String token});
  Future<Result<Nothing>> addToWatchList(
      {required int movieId, required String token, required int accountId});
}