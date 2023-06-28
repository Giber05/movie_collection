
import 'package:movie_collection/infrastructure/types/resource/resource.dart';

class Result<T> {
  final T data;
  final String message;

  const Result({required this.data, required this.message});

  Resource<T> get asResource => Resource.success(data, message);

  Result<Y> copyWith<Y>({required Y data, String? message}) =>
      Result(data: data, message: message ?? this.message);
}
