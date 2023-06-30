import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/authenticated/features/search/data/datasource/remote/sources/search_remote_dts.dart';
import 'package:movie_collection/modules/authenticated/features/search/domain/repositories/search_repo.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDts _searchRemoteDts;

  SearchRepoImpl(this._searchRemoteDts);
  @override
  Future<Result<Paginated<List<MovieModel>>>> searchMovies(
      {required String keyword,
      required int page,
      required String token}) async {
    return await _searchRemoteDts.searchMovies(
        keyword: keyword, page: page, token: token);
  }
}
