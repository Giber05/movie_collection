import 'package:movie_collection/infrastructure/architecture/mapper.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';

class MovieMapper extends JSONMapper<MovieModel> {
  @override
  MovieModel fromJSON(json) {
   return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  toJSON(MovieModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
  
}