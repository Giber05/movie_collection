part of '../home_screen.dart';

class _NowPlayingMoviesSection extends StatefulWidget {
  const _NowPlayingMoviesSection({
    Key? key,
    required this.movies,
    required this.title,
    required this.size,
    required this.onMorePressed,
  }) : super(key: key);

  final List<MovieModel> movies;
  final String title;
  final Size size;
  final VoidCallback onMorePressed;

  @override
  _NowPlayingMoviesSectionState createState() =>
      _NowPlayingMoviesSectionState();
}

class _NowPlayingMoviesSectionState extends State<_NowPlayingMoviesSection> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.size.height * 0.45,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final movie = widget.movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: () {
                        context.router
                            .push(MovieDetailRoute(movieId: movie.id));
                      },
                      child: MovieCard(
                        movie: movie,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  text: '',
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(horizontal: 32),
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
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.movies.length,
                  effect: WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Colors.black.withOpacity(.7),
              ),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: widget.onMorePressed,
              child: const Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
