import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';
import 'package:take_home_project/features/search_recipes/domain/repositories/recipes_repositoryl.dart';

class GetRecipesUseCase extends UseCase<List<RecipeEntity>?, NoParams> {
  GetRecipesUseCase({required this.recipesRepository});

  final RecipesRepository recipesRepository;

  @override
  Future<Either<Failure, List<RecipeEntity>?>> call(NoParams params) {
    return recipesRepository.getRecipes();
  }
}
