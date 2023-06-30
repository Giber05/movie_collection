import 'package:movie_collection/infrastructure/architecture/mapper.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/data/datasource/remote/mapper/spoken_language_mapper.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/movie_detail_model.dart';
import 'package:movie_collection/modules/common/movie_genre/datasource/remote/mapper/genre_mapper.dart';

class MovieDetailMapper extends JSONMapper<MovieDetailModel> {
  final GenreMapper _genreMapper = GenreMapper();
  final SpokenLanguageMapper _spokenLanguageMapper = SpokenLanguageMapper();
  @override
  MovieDetailModel fromJSON(json) {
    final genres = (json['genres'] as List<dynamic>)
        .map((genre) => _genreMapper.fromJSON(genre))
        .toList();
    final spokenLanguages = (json['spoken_languages'] as List<dynamic>)
        .map((languange) => _spokenLanguageMapper.fromJSON(languange))
        .toList();
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: genres,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: spokenLanguages,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  toJSON(MovieDetailModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
