import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/http_client/http_client.dart';
import 'package:movie_collection/infrastructure/types/api_result.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/modules/common/movie/data/datasource/remote/mapper/movie_mapper.dart';
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@Injectable(as: MovieRemoteDts)
class MovieRemoteDtsImpl implements MovieRemoteDts {
  MovieRemoteDtsImpl(this._client);
  final BaseHttpClient _client;
  final _movieMapper = MovieMapper();

  @override
  Future<APIResult<Paginated<List<MovieModel>>>> getNowPlayingMovies(
      {required int page, required String token}) async {
    return await _client.get(
      path: '/movie/now_playing?language=en-US&page=$page',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _movieMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data);
      },
      bearerToken: token,
      shouldPrint: true,
    );
  }

  @override
  Future<APIResult<Paginated<List<MovieModel>>>> getPopularMovies(
      {required int page, required String token})async  {
    return await _client.get(
      path: '/movie/popular?language=en-US&page=$page',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _movieMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data);
      },
      bearerToken: token,
      shouldPrint: true,
    );
  }

  @override
  Future<APIResult<Paginated<List<MovieModel>>>> getTopRatedMovies(
      {required int page, required String token}) async {
    return await _client.get(
      path: '/movie/top_rated?language=en-US&page=$page',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _movieMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data);
      },
      bearerToken: token,
      shouldPrint: true,
    );
  }

  @override
  Future<APIResult<Paginated<List<MovieModel>>>> getUpcommingMovies(
      {required int page, required String token})async {
    return await _client.get(
      path: '/movie/upcoming?language=en-US&page=$page',
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
