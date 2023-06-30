part of '../now_playing_movies_screen.dart';

class _NowPlayingMoviesBody extends StatefulWidget {
  const _NowPlayingMoviesBody();

  @override
  State<_NowPlayingMoviesBody> createState() => _NowPlayingMoviesBodyState();
}

class _NowPlayingMoviesBodyState extends State<_NowPlayingMoviesBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<NowPlayingMoviesCubit>().getMoreNowPlayingMovies();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesLoading) {
          return const Center(
            child: LoadingIndicator(),
          );
        }
        if (state is NowPlayingMoviesLoaded) {
          final movies = state.movies;
          return movies.isEmpty
              ? const Center(
                  child: Text(
                    'Data is not found',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: false,
                  itemCount:
                      state.hasReachedMax ? movies.length : movies.length + 1,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < movies.length) {
                      final movie = movies[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: MovieListTile(
                            movie: movie,
                            onTap: (movie) {
                              context.router
                                  .push(MovieDetailRoute(movieId: movie.id));
                            },
                          ),
                        ),
                      );
                    }
                    return state.isLoading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: LoadingIndicator(),
                          )
                        : const SizedBox();
                  },
                );
        }
        return const SizedBox();
      },
    );
  }
}
