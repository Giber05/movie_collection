import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_collection/infrastructure/routing/router.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/modules/movie_collection_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(MovieCollectionApp(
    appRouter: getIt<AppRouter>(),
  ));
}
