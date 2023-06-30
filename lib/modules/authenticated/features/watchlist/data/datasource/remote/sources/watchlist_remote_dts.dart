import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

abstract class WatchlistRemoteDts {
  Future<APIResult<Paginated<List<MovieModel>>>> getWatchlistMovies(
      {required int page, required String token, required int accountId});
}