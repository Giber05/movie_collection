import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/constant/network_constants.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/home_movies_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_home_movies.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeMovies) : super(HomeInitial());
  final GetHomeMovies _getHomeMovies;

  void getHomeMovies() async {
    final usecaseCall = await _getHomeMovies(
        GetHomeMoviesParams(token: NetworkConstants.token, page: 1));
    usecaseCall.when(
      success: (data) => emit(
        HomeLoaded(movies: data),
      ),
    );
  }

  void init() {
    emit(HomeLoading());
    getHomeMovies();
  }
}
