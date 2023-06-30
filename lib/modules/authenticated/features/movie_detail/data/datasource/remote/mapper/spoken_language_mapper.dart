import 'package:movie_collection/infrastructure/architecture/mapper.dart';
import 'package:movie_collection/modules/authenticated/features/movie_detail/domain/models/spoken_language_model.dart';

class SpokenLanguageMapper extends JSONMapper<SpokenLanguageModel> {
  @override
  SpokenLanguageModel fromJSON(json) {
    return SpokenLanguageModel(
        englishName: json['englishName'],
        iso_639_1: json['iso_639_1'],
        name: json['name']);
  }

  @override
  toJSON(SpokenLanguageModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
