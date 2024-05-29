import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/features/home/presentation/home_screen.dart';
import 'package:take_home_project/features/recipe/presentation/recipe_details_screen.dart';
import 'package:take_home_project/features/search/presentation/search_recipe_screen.dart';

final _routes = [
  GoRoute(
    name: HomeScreen.name,
    path: HomeScreen.path,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const HomeScreen(),
    ),
  ),
  GoRoute(
    name: SearchRecipeScreen.name,
    path: SearchRecipeScreen.path,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const SearchRecipeScreen(),
    ),
  ),
  GoRoute(
    name: RecipeDetailsScreen.name,
    path: RecipeDetailsScreen.path,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: RecipeDetailsScreen(index: state.extra as int),
    ),
  )
];

final router = GoRouter(
  initialLocation: HomeScreen.path,
  routes: _routes,
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    // child: ErrorPage(state.error),
    child: Container(),
  ),
);
