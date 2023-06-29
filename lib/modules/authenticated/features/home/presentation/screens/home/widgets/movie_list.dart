// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_screen.dart';

class _MovieList extends StatelessWidget {
  const _MovieList({
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextButton(
              onPressed: onMorePressed,
              child: const Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.213,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(6),
                child: MovieCard(movie: movie),
              );
            },
          ),
        ),
      ],
    );
  }
}
