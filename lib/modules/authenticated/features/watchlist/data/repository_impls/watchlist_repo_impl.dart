import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/data/datasource/remote/sources/watchlist_remote_dts.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/domain/repositories/watchlist_repo.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@Injectable(as: WatchlistRepo)
class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistRemoteDts _watchlistRemoteDts;

  WatchlistRepoImpl(this._watchlistRemoteDts);
  @override
  Future<Result<Paginated<List<MovieModel>>>> getWatchlistMovies(
      {required int page,
      required String token,
      required int accountId}) async {
    return await _watchlistRemoteDts.getWatchlistMovies(
        page: page, token: token, accountId: accountId);
  }
}
