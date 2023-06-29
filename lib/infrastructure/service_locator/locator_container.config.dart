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
    as _i12;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts.dart'
    as _i6;
import 'package:movie_collection/modules/authenticated/features/home/data/datasource/remote/sources/movie_remote_dts_impl.dart'
    as _i7;
import 'package:movie_collection/modules/authenticated/features/home/data/repository_impls/movie_repo_impl.dart'
    as _i9;
import 'package:movie_collection/modules/authenticated/features/home/domain/repositories/movie_repo.dart'
    as _i8;
import 'package:movie_collection/modules/authenticated/features/home/domain/usecases/get_popular_movies.dart'
    as _i10;
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/home_cubit.dart'
    as _i11;

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
    gh.factory<_i11.HomeCubit>(() => _i11.HomeCubit(gh<_i10.GetHomeMovies>()));
    return this;
  }
}

class _$CoreModule extends _i12.CoreModule {}
