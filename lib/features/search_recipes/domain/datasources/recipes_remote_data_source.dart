import '../dtos/response/recipe_response_dto.dart';

abstract class RecipesRemoteDataSource {
  Future<RecipeResponseDto> getRecipes();
}
