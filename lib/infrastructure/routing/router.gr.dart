// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:movie_collection/modules/authenticated/features/home/presentation/screens/now_playing_movies/now_playing_movies_screen.dart'
    as _i4;
import 'package:movie_collection/modules/authenticated/features/home/presentation/screens/popular_movies/popular_movie_screen.dart'
    as _i1;
import 'package:movie_collection/modules/authenticated/features/home/presentation/screens/top_rated_movies/top_rated_movies_screen.dart'
    as _i5;
import 'package:movie_collection/modules/authenticated/features/home/presentation/screens/upcoming_movies/upcoming_movies_screen.dart'
    as _i6;
import 'package:movie_collection/modules/authenticated/wrapper/layout_screen.dart'
    as _i2;
import 'package:movie_collection/modules/common/stacktrace/presentation/screens/stacktrace_screen.dart'
    as _i3;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    PopularMoviesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PopularMoviesScreen(),
      );
    },
    MainLayoutRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainLayoutScreen(),
      );
    },
    StackTraceRoute.name: (routeData) {
      final args = routeData.argsAs<StackTraceRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.StackTraceScreen(
          key: args.key,
          stackTrace: args.stackTrace,
          error: args.error,
        ),
      );
    },
    NowPlayingMoviesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NowPlayingMoviesScreen(),
      );
    },
    TopRatedMoviesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TopRatedMoviesScreen(),
      );
    },
    UpcomingMoviesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UpcomingMoviesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.PopularMoviesScreen]
class PopularMoviesRoute extends _i7.PageRouteInfo<void> {
  const PopularMoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PopularMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PopularMoviesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainLayoutScreen]
class MainLayoutRoute extends _i7.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainLayoutRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StackTraceScreen]
class StackTraceRoute extends _i7.PageRouteInfo<StackTraceRouteArgs> {
  StackTraceRoute({
    _i8.Key? key,
    required StackTrace stackTrace,
    required Object error,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          StackTraceRoute.name,
          args: StackTraceRouteArgs(
            key: key,
            stackTrace: stackTrace,
            error: error,
          ),
          initialChildren: children,
        );

  static const String name = 'StackTraceRoute';

  static const _i7.PageInfo<StackTraceRouteArgs> page =
      _i7.PageInfo<StackTraceRouteArgs>(name);
}

class StackTraceRouteArgs {
  const StackTraceRouteArgs({
    this.key,
    required this.stackTrace,
    required this.error,
  });

  final _i8.Key? key;

  final StackTrace stackTrace;

  final Object error;

  @override
  String toString() {
    return 'StackTraceRouteArgs{key: $key, stackTrace: $stackTrace, error: $error}';
  }
}

/// generated route for
/// [_i4.NowPlayingMoviesScreen]
class NowPlayingMoviesRoute extends _i7.PageRouteInfo<void> {
  const NowPlayingMoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NowPlayingMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NowPlayingMoviesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TopRatedMoviesScreen]
class TopRatedMoviesRoute extends _i7.PageRouteInfo<void> {
  const TopRatedMoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TopRatedMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopRatedMoviesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UpcomingMoviesScreen]
class UpcomingMoviesRoute extends _i7.PageRouteInfo<void> {
  const UpcomingMoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UpcomingMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingMoviesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
