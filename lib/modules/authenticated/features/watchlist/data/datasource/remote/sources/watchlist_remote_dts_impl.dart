import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/http_client/http_client.dart';
import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/data/datasource/remote/sources/watchlist_remote_dts.dart';
import 'package:movie_collection/modules/common/movie/data/datasource/remote/mapper/movie_mapper.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@Injectable(as: WatchlistRemoteDts)
class WatchlistRemoteDtsImpl implements WatchlistRemoteDts {
  final BaseHttpClient _client;
  final MovieMapper _movieMapper = MovieMapper();

  WatchlistRemoteDtsImpl(this._client);
  @override
  Future<APIResult<Paginated<List<MovieModel>>>> getWatchlistMovies(
      {required int page, required String token, required int accountId})async  {
    return await _client.get(
      path: '/account/$accountId/watchlist/movies?language=en-US&page=$page&sort_by=created_at.asc',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _movieMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data);
      },
      bearerToken: token,
      shouldPrint: true,
    );
  }
}
