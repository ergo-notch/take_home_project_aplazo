import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/features/search_recipes/domain/repositories/recipes_repository.dart';

class AddFavoriteRecipeUseCase extends UseCase<NoParams, RecipeEntity> {
  final RecipesRepository repository;

  AddFavoriteRecipeUseCase({required this.repository});

  @override
  Future<Either<Failure, NoParams>> call(RecipeEntity params) {
    return repository.addFavoriteRecipe(recipe: params);
  }
}
