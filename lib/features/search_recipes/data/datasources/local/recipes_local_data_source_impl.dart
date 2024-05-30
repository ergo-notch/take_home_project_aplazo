import 'package:isar/isar.dart';
import 'package:take_home_project/core/error/exceptions.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/local/recipes_local_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

class RecipesLocalDataSourceImpl extends RecipesLocalDataSource {
  RecipesLocalDataSourceImpl({required this.isar});

  final Isar isar;

  @override
  Future<void> addFavoriteRecipe({required RecipeEntity recipe}) async {
    try {
      await isar.writeTxn(() async {
        await isar.recipeEntitys.put(recipe);
      });
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteFavoritesRecipe({required RecipeEntity recipe}) async {
    try {
      await isar.writeTxn(() async {
        await isar.recipeEntitys.delete(recipe.id!);
      });
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<RecipeEntity>> getFavoritesRecipes() async {
    try {
      List<RecipeEntity> favorites = [];
      await isar.txn(() async {
        favorites = await isar.recipeEntitys.where().findAll();
      });
      return favorites;
    } catch (e) {
      throw CacheException();
    }
  }
}
