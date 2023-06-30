import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@injectable
class GetPopularMovies
    extends Usecase<GetPopularMoviesParams, Paginated<List<MovieModel>>> {
  final MovieRepo _movieRepo;

  GetPopularMovies(this._movieRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      GetPopularMoviesParams params) async {
    return await _movieRepo
        .getPopularMovies(page: params.page, token: params.token)
        .asFutureResource;
  }
}

class GetPopularMoviesParams {
  final String token;
  final int page;
  GetPopularMoviesParams({
    required this.token,
    required this.page,
  });
}
