import 'package:dartz/dartz.dart';
import 'package:take_home_project/core/error/failures.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

class SearchRecipesUseCase
    extends UseCase<List<RecipeEntity>, SearchRecipesUseCaseParams> {
  @override
  Future<Either<Failure, List<RecipeEntity>>> call(
      SearchRecipesUseCaseParams params) async {
    final recipes = List.of(params.recipes);
    final result = recipes
        .where((x) =>
            (x.name?.toLowerCase() ?? '').contains(params.searchText ?? '') ||
            (x.cuisine?.toLowerCase() ?? '').contains(params.searchText ?? ''))
        .toList();
    return Right(result);
  }
}

class SearchRecipesUseCaseParams {
  final String? searchText;
  final List<RecipeEntity> recipes;

  SearchRecipesUseCaseParams({required this.searchText, required this.recipes});
}
