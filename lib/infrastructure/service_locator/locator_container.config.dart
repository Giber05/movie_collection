// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_collection/infrastructure/architecture/cubits/messager/messenger_cubit.dart'
    as _i5;
import 'package:movie_collection/infrastructure/http_client/http_client.dart'
    as _i4;
import 'package:movie_collection/infrastructure/routing/router.dart' as _i3;
import 'package:movie_collection/infrastructure/service_locator/modules/core_module.dart'
    as _i39;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts.dart'
    as _i10;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts_impl.dart'
    as _i11;
import 'package:movie_collection/modules/authenticated/features/home/data/repository_impls/movie_repo_impl.dart'
    as _i13;
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart'
    as _i12;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_home_movies.dart'
    as _i23;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_now_playing_movies.dart'
    as _i25;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_popular_movies.dart'
    as _i26;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_top_rated_movies.dart'
    as _i27;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_upcoming_movies.dart'
    as _i28;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/home/home_cubit.dart'
    as _i30;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart'
    as _i32;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/popular_movies/popular_movies_cubit.dart'
    as _i33;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/top_rated_movies/top_rated_movies_cubit.dart'
    as _i36;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/upcoming_movies/upcoming_movies_cubit.dart'
    as _i37;
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/sources/movie_detail_remote_dts.dart'
    as _i6;
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/sources/movie_detail_remote_dts_impl.dart'
    as _i7;
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/repository_impls/movie_detail_repo_impl.dart'
    as _i9;
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/repositories/movie_detail_repo.dart'
    as _i8;
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/usecases/add_to_watchlist.dart'
    as _i22;
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/usecases/get_movie_detail.dart'
    as _i24;
import 'package:movie_collection/modules/authenticated/features/movie_detail/presentation/cubit/movie_detail_cubit.dart'
    as _i31;
import 'package:movie_collection/modules/authenticated/features/search/data/datasource/remote/sources/search_remote_dts.dart'
    as _i14;
import 'package:movie_collection/modules/authenticated/features/search/data/datasource/remote/sources/search_remote_dts_impl.dart'
    as _i15;
import 'package:movie_collection/modules/authenticated/features/search/data/repository_impls/search_repo_impl.dart'
    as _i17;
import 'package:movie_collection/modules/authenticated/features/search/domain/repositories/search_repo.dart'
    as _i16;
import 'package:movie_collection/modules/authenticated/features/search/domain/usecases/search_movies.dart'
    as _i34;
import 'package:movie_collection/modules/authenticated/features/search/presentation/cubit/search_cubit.dart'
    as _i35;
import 'package:movie_collection/modules/authenticated/features/watchlist/data/datasource/remote/sources/watchlist_remote_dts.dart'
    as _i18;
import 'package:movie_collection/modules/authenticated/features/watchlist/data/datasource/remote/sources/watchlist_remote_dts_impl.dart'
    as _i19;
import 'package:movie_collection/modules/authenticated/features/watchlist/data/repository_impls/watchlist_repo_impl.dart'
    as _i21;
import 'package:movie_collection/modules/authenticated/features/watchlist/domain/repositories/watchlist_repo.dart'
    as _i20;
import 'package:movie_collection/modules/authenticated/features/watchlist/domain/usecases/get_watchlist_movies.dart'
    as _i29;
import 'package:movie_collection/modules/authenticated/features/watchlist/presentation/cubit/watchlist_movies_cubit.dart'
    as _i38;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    gh.singleton<_i3.AppRouter>(coreModule.getAppRouter());
    gh.lazySingleton<_i4.BaseHttpClient>(() => _i4.RknHttpClient());
    gh.lazySingleton<_i5.MessengerCubit>(() => _i5.MessengerCubit());
    gh.factory<_i6.MovieDetailRemoteDts>(
        () => _i7.MovieDetailRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i8.MovieDetailRepo>(
        () => _i9.MovieDetailRepoImpl(gh<_i6.MovieDetailRemoteDts>()));
    gh.factory<_i10.MovieRemoteDts>(
        () => _i11.MovieRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i12.MovieRepo>(
        () => _i13.MovieRepoImpl(gh<_i10.MovieRemoteDts>()));
    gh.factory<_i14.SearchRemoteDts>(
        () => _i15.SearchRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i16.SearchRepo>(
        () => _i17.SearchRepoImpl(gh<_i14.SearchRemoteDts>()));
    gh.factory<_i18.WatchlistRemoteDts>(
        () => _i19.WatchlistRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i20.WatchlistRepo>(
        () => _i21.WatchlistRepoImpl(gh<_i18.WatchlistRemoteDts>()));
    gh.factory<_i22.AddToWatchList>(
        () => _i22.AddToWatchList(gh<_i8.MovieDetailRepo>()));
    gh.factory<_i23.GetHomeMovies>(
        () => _i23.GetHomeMovies(gh<_i12.MovieRepo>()));
    gh.factory<_i24.GetMovieDetail>(
        () => _i24.GetMovieDetail(gh<_i8.MovieDetailRepo>()));
    gh.factory<_i25.GetNowPlayingMovies>(
        () => _i25.GetNowPlayingMovies(gh<_i12.MovieRepo>()));
    gh.factory<_i26.GetPopularMovies>(
        () => _i26.GetPopularMovies(gh<_i12.MovieRepo>()));
    gh.factory<_i27.GetTopRatedMovies>(
        () => _i27.GetTopRatedMovies(gh<_i12.MovieRepo>()));
    gh.factory<_i28.GetUpcomingMovies>(
        () => _i28.GetUpcomingMovies(gh<_i12.MovieRepo>()));
    gh.factory<_i29.GetWatchlistMovies>(
        () => _i29.GetWatchlistMovies(gh<_i20.WatchlistRepo>()));
    gh.factory<_i30.HomeCubit>(() => _i30.HomeCubit(gh<_i23.GetHomeMovies>()));
    gh.factory<_i31.MovieDetailCubit>(() => _i31.MovieDetailCubit(
          gh<_i24.GetMovieDetail>(),
          gh<_i22.AddToWatchList>(),
          gh<_i5.MessengerCubit>(),
        ));
    gh.factory<_i32.NowPlayingMoviesCubit>(
        () => _i32.NowPlayingMoviesCubit(gh<_i25.GetNowPlayingMovies>()));
    gh.factory<_i33.PopularMoviesCubit>(
        () => _i33.PopularMoviesCubit(gh<_i26.GetPopularMovies>()));
    gh.factory<_i34.SearchMovies>(
        () => _i34.SearchMovies(gh<_i16.SearchRepo>()));
    gh.factory<_i35.SearchMoviesCubit>(
        () => _i35.SearchMoviesCubit(gh<_i34.SearchMovies>()));
    gh.factory<_i36.TopRatedMoviesCubit>(
        () => _i36.TopRatedMoviesCubit(gh<_i27.GetTopRatedMovies>()));
    gh.factory<_i37.UpcomingMoviesCubit>(
        () => _i37.UpcomingMoviesCubit(gh<_i28.GetUpcomingMovies>()));
    gh.factory<_i38.WatchlistMoviesCubit>(
        () => _i38.WatchlistMoviesCubit(gh<_i29.GetWatchlistMovies>()));
    return this;
  }
}

class _$CoreModule extends _i39.CoreModule {}
