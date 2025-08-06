import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/models/todo.dart';
import 'package:poc/views/details/details_screen.dart';
import 'package:poc/views/home/home_screen.dart';

enum NamedRoutes { home, details }

extension NamedRoutesExt on NamedRoutes {
  String get path => "/$name";
}

GoRoute buildRoute(NamedRoutes r, Widget Function(BuildContext, GoRouterState)? builder) {
  return GoRoute(path: r.path, name: r.name, builder: builder);
}

final router = GoRouter(
  initialLocation: NamedRoutes.home.path,
  routes: [
    buildRoute(NamedRoutes.home, (context, state) => const HomeScreen()),
    buildRoute(NamedRoutes.details, (context, state) => DetailsScreen(todo: state.extra as Todo)),
  ],
);
