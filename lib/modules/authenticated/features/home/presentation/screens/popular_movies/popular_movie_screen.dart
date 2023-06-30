import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_collection/infrastructure/widgets/movie/movie_listtile.dart';
part 'widgets/popular_movies_body.dart';

@RoutePage()
class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PopularMoviesCubit>()..getPopularMovies(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Popular Movies'),
        ),
        body: const _PopularMoviesBody(),
      ),
    );
  }
}
