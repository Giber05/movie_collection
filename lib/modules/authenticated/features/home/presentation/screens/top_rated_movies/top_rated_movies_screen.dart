import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/top_rated_movies/top_rated_movies_cubit.dart';
import 'package:movie_collection/infrastructure/widgets/movie/movie_listtile.dart';
part 'widgets/top_rated_movies_body.dart';

@RoutePage()
class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Top Rated Movies'),
        ),
        body: const _TopRatedMoviesBody(),
      ),
    );
  }
}
