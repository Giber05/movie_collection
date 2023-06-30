import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/infrastructure/widgets/movie/movie_listtile.dart';
import 'package:movie_collection/modules/authenticated/features/watchlist/presentation/cubit/watchlist_movies_cubit.dart';
part 'widgets/watchlist_movies_body.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WatchlistMoviesCubit>()..getWatchlistMovies(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Your Watchlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: const _WatchlistMoviesBody(),
      ),
    );
  }
}
