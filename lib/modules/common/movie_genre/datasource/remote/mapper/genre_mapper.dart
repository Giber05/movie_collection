import 'package:movie_collection/infrastructure/architecture/mapper.dart';
import 'package:movie_collection/modules/common/movie_genre/domain/models/genre_model.dart';

class GenreMapper extends JSONMapper<GenreModel> {
  @override
  GenreModel fromJSON(json) {
    return GenreModel(id: json['id'], name: json['name']);
  }

  @override
  toJSON(GenreModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
