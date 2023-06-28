import 'package:injectable/injectable.dart';
import 'package:movie_collection/infrastructure/routing/router.dart';

@module
abstract class CoreModule {
  @singleton
  AppRouter getAppRouter() {
    return AppRouter();
  }
}
