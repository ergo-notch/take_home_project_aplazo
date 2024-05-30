import 'package:equatable/equatable.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

sealed class FavoritesRecipesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFavoriteRecipeEvent extends FavoritesRecipesEvent {
  AddFavoriteRecipeEvent({required this.recipeEntity});

  final RecipeEntity recipeEntity;
}

class DeleteFavoriteRecipeEvent extends FavoritesRecipesEvent {
  DeleteFavoriteRecipeEvent({required this.recipeEntity});

  final RecipeEntity recipeEntity;
}

class GetFavoritesRecipesEvent extends FavoritesRecipesEvent {}

class FetchedFavoritesRecipesEvent extends FavoritesRecipesEvent {
  FetchedFavoritesRecipesEvent({required this.favoriteRecipes});

  final List<RecipeEntity> favoriteRecipes;
}

class FailedGetFavoritesRecipesEvent extends FavoritesRecipesEvent {}
