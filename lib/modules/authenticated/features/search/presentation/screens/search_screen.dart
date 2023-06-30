import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/routing/router.gr.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';
import 'package:movie_collection/infrastructure/widgets/loading_indicator.dart';
import 'package:movie_collection/infrastructure/widgets/movie/movie_listtile.dart';
import 'package:movie_collection/modules/authenticated/features/search/presentation/cubit/search_cubit.dart';
import 'package:movie_collection/modules/common/movie/domain/models/movie_model.dart';
part 'widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchMoviesCubit>(),
      child: Scaffold(backgroundColor: Colors.black, body: _SearchBody()),
    );
  }
}
