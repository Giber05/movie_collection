// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:movie_collection/modules/authenticated/wrapper/layout_screen.dart'
    as _i1;
import 'package:movie_collection/modules/common/stacktrace/presentation/screens/stacktrace_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainLayoutRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainLayoutScreen(),
      );
    },
    StackTraceRoute.name: (routeData) {
      final args = routeData.argsAs<StackTraceRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.StackTraceScreen(
          key: args.key,
          stackTrace: args.stackTrace,
          error: args.error,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MainLayoutScreen]
class MainLayoutRoute extends _i3.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainLayoutRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.StackTraceScreen]
class StackTraceRoute extends _i3.PageRouteInfo<StackTraceRouteArgs> {
  StackTraceRoute({
    _i4.Key? key,
    required StackTrace stackTrace,
    required Object error,
    List<_i3.PageRouteInfo>? children,
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

  static const _i3.PageInfo<StackTraceRouteArgs> page =
      _i3.PageInfo<StackTraceRouteArgs>(name);
}

class StackTraceRouteArgs {
  const StackTraceRouteArgs({
    this.key,
    required this.stackTrace,
    required this.error,
  });

  final _i4.Key? key;

  final StackTrace stackTrace;

  final Object error;

  @override
  String toString() {
    return 'StackTraceRouteArgs{key: $key, stackTrace: $stackTrace, error: $error}';
  }
}
