import 'package:equatable/equatable.dart';

class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  static List<GenreModel> genres = [
    GenreModel(id: 28, name: "Action"),
    GenreModel(id: 12, name: "Adventure"),
    GenreModel(id: 16, name: "Animation"),
    GenreModel(id: 35, name: "Comedy"),
    GenreModel(id: 80, name: "Crime"),
    GenreModel(id: 99, name: "Documentary"),
    GenreModel(id: 18, name: "Drama"),
    GenreModel(id: 10751, name: "Family"),
    GenreModel(id: 14, name: "Fantasy"),
    GenreModel(id: 36, name: "History"),
    GenreModel(id: 27, name: "Horror"),
    GenreModel(id: 10402, name: "Music"),
    GenreModel(id: 9648, name: "Mystery"),
    GenreModel(id: 10749, name: "Romance"),
    GenreModel(id: 878, name: "Science Fiction"),
    GenreModel(id: 10770, name: "TV Movie"),
    GenreModel(id: 53, name: "Thriller"),
    GenreModel(id: 10752, name: "War"),
    GenreModel(id: 37, name: "Western"),
  ];

  static String getGenreName(int genreId) {
    final genre = genres.firstWhere((genre) => genre.id == genreId, orElse: () => GenreModel(id: 0, name: ""));
    return genre.name;
  }
}