// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/search/domain/repositories/search_repo.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

@injectable
class SearchMovies
    extends Usecase<SearchMoviesParams, Paginated<List<MovieModel>>> {
  final SearchRepo _searchRepo;

  SearchMovies(this._searchRepo);
  @override
  Future<Resource<Paginated<List<MovieModel>>>> execute(
      SearchMoviesParams params) async {
    return await _searchRepo
        .searchMovies(
          page: params.page,
          token: params.token,
          keyword: params.keyword,
        )
        .asFutureResource;
  }
}

class SearchMoviesParams {
  final String token;
  final int page;
  final String keyword;
  SearchMoviesParams({
    required this.token,
    required this.page,
    required this.keyword,
  });
}
