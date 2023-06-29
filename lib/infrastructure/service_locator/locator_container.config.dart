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
    as _i20;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts.dart'
    as _i6;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts_impl.dart'
    as _i7;
import 'package:movie_collection/modules/authenticated/features/home/data/repository_impls/movie_repo_impl.dart'
    as _i9;
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart'
    as _i8;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_home_movies.dart'
    as _i10;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_now_playing_movies.dart'
    as _i11;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_popular_movies.dart'
    as _i12;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_top_rated_movies.dart'
    as _i13;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_upcoming_movies.dart'
    as _i14;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/home/home_cubit.dart'
    as _i15;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart'
    as _i16;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/popular_movies/popular_movies_cubit.dart'
    as _i17;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/top_rated_movies/top_rated_movies_cubit.dart'
    as _i18;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/upcoming_movies/upcoming_movies_cubit.dart'
    as _i19;

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
    gh.factory<_i6.MovieRemoteDts>(
        () => _i7.MovieRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i8.MovieRepo>(
        () => _i9.MovieRepoImpl(gh<_i6.MovieRemoteDts>()));
    gh.factory<_i10.GetHomeMovies>(
        () => _i10.GetHomeMovies(gh<_i8.MovieRepo>()));
    gh.factory<_i11.GetNowPlayingMovies>(
        () => _i11.GetNowPlayingMovies(gh<_i8.MovieRepo>()));
    gh.factory<_i12.GetPopularMovies>(
        () => _i12.GetPopularMovies(gh<_i8.MovieRepo>()));
    gh.factory<_i13.GetTopRatedMovies>(
        () => _i13.GetTopRatedMovies(gh<_i8.MovieRepo>()));
    gh.factory<_i14.GetUpcomingMovies>(
        () => _i14.GetUpcomingMovies(gh<_i8.MovieRepo>()));
    gh.factory<_i15.HomeCubit>(() => _i15.HomeCubit(gh<_i10.GetHomeMovies>()));
    gh.factory<_i16.NowPlayingMoviesCubit>(
        () => _i16.NowPlayingMoviesCubit(gh<_i11.GetNowPlayingMovies>()));
    gh.factory<_i17.PopularMoviesCubit>(
        () => _i17.PopularMoviesCubit(gh<_i12.GetPopularMovies>()));
    gh.factory<_i18.TopRatedMoviesCubit>(
        () => _i18.TopRatedMoviesCubit(gh<_i13.GetTopRatedMovies>()));
    gh.factory<_i19.UpcomingMoviesCubit>(
        () => _i19.UpcomingMoviesCubit(gh<_i14.GetUpcomingMovies>()));
    return this;
  }
}

class _$CoreModule extends _i20.CoreModule {}
