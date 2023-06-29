import 'package:auto_route/auto_route.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';
import 'package:movie_collection/modules/authenticated/wrapper/layout_screen.dart';

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
      ];
}
