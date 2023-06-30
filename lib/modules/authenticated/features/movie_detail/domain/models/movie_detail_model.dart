import 'package:equatable/equatable.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/spoken_language_model.dart';
import 'package:movie_collection/modules/common/movie_genre/domain/models/genre_model.dart';

class MovieDetailModel extends Equatable {
  final bool adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<GenreModel> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String? posterPath;

  final String? releaseDate;
  final num revenue;
  final int? runtime;
  final List<SpokenLanguageModel> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final num voteAverage;
  final int? voteCount;

  const MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,

    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,

        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}




