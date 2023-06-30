import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/nothing/nothing.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';

abstract class MovieDetailRemoteDts {
  Future<APIResult<MovieDetailModel>> getMovieDetail(
      {required int movieId, required String token});
  Future<APIResult<Nothing>> addToWatchList(
      {required int movieId, required String token, required int accountId});
}
