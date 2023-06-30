import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/architecture/usecase.dart';
import 'package:movie_collection/infrastructure/types/nothing/nothing.dart';
import 'package:movie_collection/infrastructure/types/resource/resource.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/repositories/movie_detail_repo.dart';

class AddToWatchListParams {
  final int movieId;
  final String token;
  final int accountId;

  AddToWatchListParams(this.movieId, this.token, this.accountId);
}

@injectable
class AddToWatchList extends Usecase<AddToWatchListParams, Nothing> {
  final MovieDetailRepo _movieDetailRepo;

  AddToWatchList(this._movieDetailRepo);
  @override
  Future<Resource<Nothing>> execute(
          AddToWatchListParams params) async =>
      _movieDetailRepo.addToWatchList(
              movieId: params.movieId, token: params.token, accountId: params.accountId)
          .asFutureResource;
}
