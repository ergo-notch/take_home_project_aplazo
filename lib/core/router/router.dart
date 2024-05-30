import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home_project/features/favorites/presentation/favorites_recipes_screen.dart';
import 'package:take_home_project/features/home/presentation/home_screen.dart';

import '../../features/recipe_details/presentation/recipe_details_screen.dart';
import '../../features/search_recipes/presentation/search_recipe_screen.dart';

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
      child: RecipeDetailsScreen(
          recipeDetailsArgs: state.extra as RecipeDetailsArgs),
    ),
  ),
  GoRoute(
    name: FavoritesRecipesScreen.name,
    path: FavoritesRecipesScreen.path,
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const FavoritesRecipesScreen(),
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
