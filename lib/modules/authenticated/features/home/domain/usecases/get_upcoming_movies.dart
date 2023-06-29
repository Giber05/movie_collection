import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@injectable
class GetUpcomingMovies
    extends Usecase<GetUpcomingMoviesParams, Paginated<List<MovieModel>>> {
  final MovieRepo _movieRepo;

  GetUpcomingMovies(this._movieRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      GetUpcomingMoviesParams params) async {
    return await _movieRepo
        .getUpcommingMovies(page: params.page, token: params.token)
        .asFutureResource;
  }
}

class GetUpcomingMoviesParams {
  final String token;
  final int page;
  GetUpcomingMoviesParams({
    required this.token,
    required this.page,
  });
}
