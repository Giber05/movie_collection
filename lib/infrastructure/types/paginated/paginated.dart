
import 'package:movie_collection/infrastructure/types/json.dart';

class Paginated<T> {
  final T data;
  final Pagination pagination;

  Paginated({required this.data, required this.pagination});

  factory Paginated.resultMapper(JSON json, T data) {
    return Paginated(
        data: data,
        pagination: Pagination.fromJson(json['page']));
  }
}

class Pagination {
  final int total;
  final int size;
  final int totalPage;
  final int current;

  Pagination(
      {required this.total,
      required this.size,
      required this.totalPage,
      required this.current});
  factory Pagination.fromJson(JSON json) => Pagination(
      total: json['total'],
      size: json['size'],
      totalPage: json['totalPage'],
      current: json['current']);
}
