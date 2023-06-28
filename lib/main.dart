import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_collection/infrastructure/routing/router.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/modules/movie_collection_app.dart';

void main() {
    if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
   WidgetsFlutterBinding.ensureInitialized();
     configureInjection();
  runApp( MovieCollectionApp(
    appRouter: getIt<AppRouter>(),
  ));
}
