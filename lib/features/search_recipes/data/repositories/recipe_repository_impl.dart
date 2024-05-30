import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/network/http-client/http_client_errors.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/recipes_remote_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/features/search_recipes/domain/repositories/recipes_repositoryl.dart';

class RecipeRepositoryImpl extends RecipesRepository {
  RecipeRepositoryImpl({required this.remoteDataSource});

  final RecipesRemoteDataSource remoteDataSource;

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
}
