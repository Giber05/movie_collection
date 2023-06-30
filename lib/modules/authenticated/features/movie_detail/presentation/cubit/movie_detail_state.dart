// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailModel data;
  const MovieDetailLoaded({
    required this.data,
  });
}

class MovieDetailFailed extends MovieDetailState {
  final String message;
  const MovieDetailFailed({
    required this.message,
  });

}

class AddToWatchListLoading extends MovieDetailLoaded {
  const AddToWatchListLoading({required super.data});
}

class AddToWatchListFailed extends MovieDetailLoaded {
  final String message;
  const AddToWatchListFailed({
    required super.data,
    required this.message,
  });
}
