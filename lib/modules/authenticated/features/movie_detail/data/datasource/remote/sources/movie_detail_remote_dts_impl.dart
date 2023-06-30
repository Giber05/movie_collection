import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/http_client/http_client.dart';
import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/nothing/nothing.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/mapper/movie_detail_mapper.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/sources/movie_detail_remote_dts.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';

@Injectable(as: MovieDetailRemoteDts)
class MovieDetailRemoteDtsImpl implements MovieDetailRemoteDts {
  final BaseHttpClient _client;
  final MovieDetailMapper _movieDetailMapper = MovieDetailMapper();

  MovieDetailRemoteDtsImpl(this._client);
  @override
  Future<APIResult<Nothing>> addToWatchList(
      {required int movieId,
      required String token,
      required int accountId}) async {
    return await _client.post(
      shouldPrint: true,
      headers: {"Content-Type": "application/json"},
      bearerToken: token,
      path: '/account/$accountId/watchlist',
      body: {
        "media_type": "movie",
        "media_id": movieId,
        "watchlist": true,
      },
      mapper: (json) => Nothing(),
    );
  }

  @override
  Future<APIResult<MovieDetailModel>> getMovieDetail(
      {required int movieId, required String token}) async {
    return await _client.get(
      shouldPrint: true,
      bearerToken: token,
      path: '/movie/$movieId?language=en-US',
      mapper: (json) => _movieDetailMapper.fromJSON(json),

    );
  }
}
