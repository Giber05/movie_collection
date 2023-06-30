// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_collection/infrastructure/architecture/cubits/messager/messenger_cubit.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/usecases/add_to_watchlist.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/usecases/get_movie_detail.dart';

part 'movie_detail_state.dart';

@injectable
class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(
    this._getMovieDetail,
    this._addToWatchList,
    this._messengerCubit,
  ) : super(MovieDetailInitial());

  final GetMovieDetail _getMovieDetail;
  final AddToWatchList _addToWatchList;
  final MessengerCubit _messengerCubit;

  void getMovieDetail(int movieId) async {
    emit(MovieDetailLoading());
    final usecaseCall = await _getMovieDetail(
        GetMovieDetailParams(movieId, NetworkConstants.token));
    usecaseCall.when(
      success: (data) => emit(MovieDetailLoaded(data: data)),
      error: (exception) => emit(MovieDetailFailed(message: exception.message)),
    );
  }

  void addToWatchlist(int movieId) async {
    final currentState = state;
    if (currentState is MovieDetailLoaded) {
      emit(AddToWatchListLoading(data: currentState.data));
      final usecaseCall = await _addToWatchList(AddToWatchListParams(
          movieId, NetworkConstants.token, NetworkConstants.accountId));

      usecaseCall.when(success: (data) {
        emit(MovieDetailLoaded(data: currentState.data));
        _messengerCubit
            .showSuccessSnackbar('Movied added to watchlist successfully');
      }, error: (exception) {
        emit(AddToWatchListFailed(
            data: currentState.data, message: exception.message));
        _messengerCubit.showErrorSnackbar(exception.message);
      });
    }
  }
}
