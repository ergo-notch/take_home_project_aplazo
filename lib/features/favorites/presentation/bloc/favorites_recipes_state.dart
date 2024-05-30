import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_state.dart';

import '../../../search_recipes/domain/entities/recipe_entity.dart';

class FavoritesRecipesState {
  const FavoritesRecipesState(
      {this.status = PostStatus.initial,
      this.favoritesRecipes = const <RecipeEntity>[],
      this.errorMessage});

  final PostStatus status;
  final List<RecipeEntity> favoritesRecipes;
  final String? errorMessage;

  FavoritesRecipesState copyWith(
      {PostStatus? status,
      List<RecipeEntity>? favoritesRecipes,
      String? errorMessage}) {
    return FavoritesRecipesState(
      status: status ?? this.status,
      favoritesRecipes: favoritesRecipes ?? this.favoritesRecipes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
