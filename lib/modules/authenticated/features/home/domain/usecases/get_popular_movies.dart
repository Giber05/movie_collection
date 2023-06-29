// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/home_movies_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart';

@injectable
class GetHomeMovies
    extends Usecase<GetPopularMoviesParams, HomeMoviesModel> {
  final MovieRepo _movieRepo;

  GetHomeMovies(this._movieRepo);
  @override
  Future<Resource<HomeMoviesModel>> execute(
      GetPopularMoviesParams params) async {
    return await _movieRepo
        .getHomeMovies(page: params.page, token: params.token)
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
