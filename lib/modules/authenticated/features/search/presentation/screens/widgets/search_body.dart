part of '../search_screen.dart';

class _SearchBody extends StatefulWidget {
  const _SearchBody({Key? key}) : super(key: key);

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  void _performSearch(String query) {
    context.read<SearchMoviesCubit>().searchMovies(query);

    setState(() {
      _searchQuery = query;
    });
  }

  void _scrollListener() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<SearchMoviesCubit>().getMoreMovies(_searchQuery);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search movies...',
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.grey[800],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              _performSearch(value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Search results for "${_searchQuery}"',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
            builder: (context, state) {
              if (state is SearchMoviesLoading) {
                return const Center(
                  child: LoadingIndicator(),
                );
              }
              if (state is SearchMoviesLoaded) {
                final movies = state.movies;
                return state.movies.isEmpty
                    ? const Center(
                        child: Text(
                          'Data is not found',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: state.hasReachedMax
                              ? movies.length
                              : movies.length + 1,
                          itemBuilder: (context, index) {
                            if (index < movies.length) {
                              final movie = movies[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: MovieListTile(
                                    movie: movie,
                                    onTap: (movie) {
                                      context.router.push(
                                          MovieDetailRoute(movieId: movie.id));
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
                        ),
                      );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
