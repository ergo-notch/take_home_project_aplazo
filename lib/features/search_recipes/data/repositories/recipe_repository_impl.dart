import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/exceptions.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/network/http-client/http_client_errors.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/local/recipes_local_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/remote/recipes_remote_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/features/search_recipes/domain/repositories/recipes_repository.dart';

class RecipeRepositoryImpl extends RecipesRepository {
  RecipeRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  final RecipesRemoteDataSource remoteDataSource;
  final RecipesLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<RecipeEntity>?>> getRecipes() async {
    try {
      final responseDto = await remoteDataSource.getRecipes();
      final result = responseDto.recipes
          ?.map((x) => RecipeEntity.dtoToEntity(recipeDto: x))
          .toList();
      return Right(result);
    } catch (error) {
      return Left(Failure(message: (error as HttpClientError).message));
    }
  }

  @override
  Future<Either<Failure, NoParams>> addFavoriteRecipe(
      {required RecipeEntity recipe}) async {
    try {
      await localDataSource.addFavoriteRecipe(recipe: recipe);
      return Right(NoParams());
    } catch (error) {
      return Left(Failure(message: (error as CacheException).toString()));
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteFavoriteRecipe(
      {required RecipeEntity recipe}) async {
    try {
      await localDataSource.deleteFavoritesRecipe(recipe: recipe);
      return Right(NoParams());
    } catch (error) {
      return Left(Failure(message: (error as CacheException).toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecipeEntity>?>> getFavoriteRecipes() async {
    try {
      final result = await localDataSource.getFavoritesRecipes();
      return Right(result);
    } catch (error) {
      return Left(Failure(message: (error as CacheException).toString()));
    }
  }
}
