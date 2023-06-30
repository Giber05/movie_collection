// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_collection/infrastructure/widgets/image/network_image.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final BoxFit? fit;
  const MovieCard({
    Key? key,
    required this.movie,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: MCNetworkImage(imageUrl: movie.posterPath, fit: fit),
      ),
    );
  }
}
