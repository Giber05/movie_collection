// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_collection/infrastructure/architecture/cubits/messager/messenger_cubit.dart';
import 'package:movie_collection/infrastructure/routing/router.dart';
import 'package:movie_collection/infrastructure/service_locator/locator_container.dart';

class MovieCollectionApp extends StatelessWidget {
  const MovieCollectionApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MessengerCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        builder: (context, child) =>
            BlocListener<MessengerCubit, MessengerState>(
          listener: (context, state) {
            if (state is MessengerIdle) return;
            if (state is MessengerSnackbar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: state.backgroundColor(context),
              ));
            }
            context.read<MessengerCubit>().idle();
          },
          child: child!,
        ),
      ),
    );
  }
}
