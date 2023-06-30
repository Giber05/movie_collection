import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/repositories/movie_detail_repo.dart';

class GetMovieDetailParams {
  final int movieId;
  final String token;

  GetMovieDetailParams(this.movieId, this.token);
}

@injectable
class GetMovieDetail extends Usecase<GetMovieDetailParams, MovieDetailModel> {
  final MovieDetailRepo _movieDetailRepo;

  GetMovieDetail(this._movieDetailRepo);
  @override
  Future<Resource<MovieDetailModel>> execute(
          GetMovieDetailParams params) async =>
      _movieDetailRepo
          .getMovieDetail(movieId: params.movieId, token: params.token)
          .asFutureResource;
}
