// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_screen.dart';

class _MovieList extends StatelessWidget {
  const _MovieList({
    Key? key,
    required this.movies,
    required this.title,
    required this.size,
  }) : super(key: key);

  final List<MovieModel> movies;
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
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
