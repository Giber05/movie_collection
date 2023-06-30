
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/domain/repositories/watchlist_repo.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@injectable
class GetWatchlistMovies
    extends Usecase<GetWatchlistMoviesParams, Paginated<List<MovieModel>>> {
  final WatchlistRepo _watchlistRepo;

  GetWatchlistMovies(this._watchlistRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      GetWatchlistMoviesParams params) async {
    return await _watchlistRepo
        .getWatchlistMovies(page: params.page, token: params.token, accountId: params.accountId)
        .asFutureResource;
  }
}

class GetWatchlistMoviesParams {
  final String token;
  final int page;
  final int accountId;
  GetWatchlistMoviesParams({
    required this.token,
    required this.page,
    required this.accountId,
  });
}