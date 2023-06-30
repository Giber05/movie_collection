import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/types/nothing/nothing.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/sources/movie_detail_remote_dts.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/repositories/movie_detail_repo.dart';

@Injectable(as:MovieDetailRepo)
class MovieDetailRepoImpl implements MovieDetailRepo {
  final MovieDetailRemoteDts _movieDetailRemoteDts;

  MovieDetailRepoImpl(this._movieDetailRemoteDts);
  @override
  Future<Result<Nothing>> addToWatchList(
      {required int movieId,
      required String token,
      required int accountId}) async {
    return await _movieDetailRemoteDts.addToWatchList(
        movieId: movieId, token: token, accountId: accountId);
  }

  @override
  Future<Result<MovieDetailModel>> getMovieDetail(
      {required int movieId, required String token}) async {
    return await _movieDetailRemoteDts.getMovieDetail(
        movieId: movieId, token: token);
  }
}
