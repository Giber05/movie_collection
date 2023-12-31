// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_collection/modules/common/movie_genre/domain/models/genre_model.dart';

class GenreBubble extends StatelessWidget {
  final List<GenreModel> genres;

  const GenreBubble({required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0, // Jarak antara bubble genre
      runSpacing: 6.0, // Jarak antara baris bubble genre
      alignment: WrapAlignment.start,
      children: genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: Colors.red, // Warna latar belakang bubble
            borderRadius: BorderRadius.circular(20.0), // Bentuk border bubble
          ),
          child: Text(
            genre.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
    );
  }
}
