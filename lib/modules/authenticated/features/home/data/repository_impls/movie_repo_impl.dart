import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/home_movies_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@Injectable(as: MovieRepo)
class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDts _movieRemoteDts;

  MovieRepoImpl(this._movieRemoteDts);
  @override
  Future<Result<Paginated<List<MovieModel>>>> getNowPlayingMovies(
      {required int page, required String token}) async {
    return await _movieRemoteDts.getNowPlayingMovies(page: page, token: token);
  }

  @override
  Future<Result<Paginated<List<MovieModel>>>> getPopularMovies(
      {required int page, required String token}) async {
    return await _movieRemoteDts.getPopularMovies(page: page, token: token);
  }

  @override
  Future<Result<Paginated<List<MovieModel>>>> getTopRatedMovies(
      {required int page, required String token}) async {
    return await _movieRemoteDts.getTopRatedMovies(page: page, token: token);
  }

  @override
  Future<Result<Paginated<List<MovieModel>>>> getUpcommingMovies(
      {required int page, required String token}) async {
    return await _movieRemoteDts.getUpcommingMovies(page: page, token: token);
  }

  @override
  Future<Result<HomeMoviesModel>> getHomeMovies(
      {required int page, required String token}) async {
    final popularMovies =
        (await _movieRemoteDts.getPopularMovies(page: page, token: token))
            .data
            .data;
    final upcomingMovies =
        (await _movieRemoteDts.getUpcommingMovies(page: page, token: token))
            .data
            .data;
    final topRatedMovies =
        (await _movieRemoteDts.getTopRatedMovies(page: page, token: token))
            .data
            .data;
    final nowPlayingMovies =
        (await _movieRemoteDts.getNowPlayingMovies(page: page, token: token))
            .data
            .data;

    return Result(
        data: HomeMoviesModel(
            popularMovies: popularMovies,
            nowPlayingMovies: nowPlayingMovies,
            upcomingMovies: upcomingMovies,
            topRatedMovies: topRatedMovies),
        message: 'Fetch data is success');
  }
}
