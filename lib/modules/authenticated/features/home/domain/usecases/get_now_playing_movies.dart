import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@injectable
class GetNowPlayingMovies
    extends Usecase<GetNowPlayingMoviesParams, Paginated<List<MovieModel>>> {
  final MovieRepo _movieRepo;

  GetNowPlayingMovies(this._movieRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      GetNowPlayingMoviesParams params) async {
    return await _movieRepo
        .getNowPlayingMovies(page: params.page, token: params.token)
        .asFutureResource;
  }
}

class GetNowPlayingMoviesParams {
  final String token;
  final int page;
  GetNowPlayingMoviesParams({
    required this.token,
    required this.page,
  });
}
