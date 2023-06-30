import 'package:auto_route/auto_route.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';

///
///
/// flutter pub run build_runner build --delete-conflicting-outputs
///


@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainLayoutRoute.page, initial: true),
        AutoRoute(page: StackTraceRoute.page),
        AutoRoute(page: PopularMoviesRoute.page),
        AutoRoute(page: TopRatedMoviesRoute.page),
        AutoRoute(page: UpcomingMoviesRoute.page),
        AutoRoute(page: NowPlayingMoviesRoute.page),
        AutoRoute(page: MovieDetailRoute.page),
      ];
}
