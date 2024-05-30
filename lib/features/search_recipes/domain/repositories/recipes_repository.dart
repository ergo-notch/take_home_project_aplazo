import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

abstract class RecipesRepository {
  Future<Either<Failure, List<RecipeEntity>?>> getRecipes();

  Future<Either<Failure, NoParams>> addFavoriteRecipe(
      {required RecipeEntity recipe});

  Future<Either<Failure, NoParams>> deleteFavoriteRecipe(
      {required RecipeEntity recipe});

  Future<Either<Failure, List<RecipeEntity>?>> getFavoriteRecipes();
}
