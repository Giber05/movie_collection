// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';

import 'package:movie_collection/infrastructure/widgets/button/default_button.dart';
import 'package:movie_collection/infrastructure/widgets/card/movie_card.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/modules/authenticated/features/home/domain/models/movie_model.dart';
import 'package:movie_collection/modules/authenticated/features/home/presentation/cubit/home_cubit.dart';
part 'widgets/movie_list_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..init(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _HomeBody(size: size),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: LoadingIndicator(),
          );
        }
        if (state is HomeLoaded) {
          return ListView(
            children: [
              Placeholder(
                fallbackHeight: size.height / 3,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    text: '',
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    content: const Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text('Watch Now')
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  DefaultButton(
                    text: '',
                    onPressed: () {},
                    content: const Icon(Icons.add),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _MovieList(
                  size: size,
                  title: 'Now Playing Movies',
                  movies: state.movies.nowPlayingMovies,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _MovieList(
                  size: size,
                  title: 'Popular Movies',
                  movies: state.movies.popularMovies,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _MovieList(
                  size: size,
                  title: 'Top Rated Movies',
                  movies: state.movies.topRatedMovies,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _MovieList(
                  size: size,
                  title: 'Upcoming Movies',
                  movies: state.movies.upcomingMovies,
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
