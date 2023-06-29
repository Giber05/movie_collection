import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@injectable
class GetTopRatedMovies
    extends Usecase<GetTopRatedMoviesParams, Paginated<List<MovieModel>>> {
  final MovieRepo _movieRepo;

  GetTopRatedMovies(this._movieRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      GetTopRatedMoviesParams params) async {
    return await _movieRepo
        .getTopRatedMovies(page: params.page, token: params.token)
        .asFutureResource;
  }
}

class GetTopRatedMoviesParams {
  final String token;
  final int page;
  GetTopRatedMoviesParams({
    required this.token,
    required this.page,
  });
}
