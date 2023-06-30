import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/http_client/http_client.dart';
import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/modules/authenticated/features/search/data/datasource/remote/sources/search_remote_dts.dart';
import 'package:movie_collection/modules/common/movie/data/datasource/remote/mapper/movie_mapper.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@Injectable(as: SearchRemoteDts)
class SearchRemoteDtsImpl implements SearchRemoteDts {
  final BaseHttpClient _client;

  SearchRemoteDtsImpl(this._client);

  final _movieMapper = MovieMapper();
  @override
  Future<APIResult<Paginated<List<MovieModel>>>> searchMovies(
      {required String keyword,
      required int page,
      required String token}) async {
    return await _client.get(
      shouldPrint: true,
      bearerToken: token,
      path:
          '/search/movie?query=$keyword&language=en-US&page=$page',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _movieMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data);
      },
    );
  }
}
