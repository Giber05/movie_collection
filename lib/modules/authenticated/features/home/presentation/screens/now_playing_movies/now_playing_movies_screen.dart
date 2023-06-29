import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/widgets/movie_listtile.dart';
part 'widgets/now_playing_movies_body.dart';

@RoutePage()
class NowPlayingMoviesScreen extends StatelessWidget {
  const NowPlayingMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Now Playing Movies'),
        ),
        body: const _NowPlayingMoviesBody(),
      ),
    );
  }
}
