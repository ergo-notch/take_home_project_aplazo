import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

abstract class RecipesLocalDataSource {
  Future<void> addFavoriteRecipe({required RecipeEntity recipe});

  Future<List<RecipeEntity>> getFavoritesRecipes();

  Future<void> deleteFavoritesRecipe({required RecipeEntity recipe});
}
