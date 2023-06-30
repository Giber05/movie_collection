import 'package:movie_collection/infrastructure/types/paginated/paginated.dart';
import 'package:movie_collection/infrastructure/types/repo_result.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

abstract class SearchRepo {
  Future<Result<Paginated<List<MovieModel>>>> searchMovies({required String keyword, required int page, required String token});

}