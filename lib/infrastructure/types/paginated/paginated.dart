// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_collection/infrastructure/types/json.dart';

class Paginated<T> {
  final T data;
  final int totalData;
  final int totalPage;
  final int current;

  Paginated({
    required this.data,
    required this.totalData,
    required this.totalPage,
    required this.current,
  });

  factory Paginated.resultMapper(JSON json, T data) {
    return Paginated(
        data: data,
        totalData: json['total_results'],
        totalPage: json['total_pages'],
        current: json['page']);
  }
}