import 'package:take_home_project/core/network/http-client/http_client_service.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/recipes_remote_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/dtos/recipe_dto.dart';

import '../../../../core/network/http-client/http_client_errors.dart';
import '../../domain/dtos/response/recipe_response_dto.dart';

class RecipeRemoteDataSourceImpl extends RecipesRemoteDataSource {
  RecipeRemoteDataSourceImpl({required this.client});

  final HttpClientService client;

  @override
  Future<RecipeResponseDto> getRecipes() async {
    try {
      final response = await client.get(path: '/recipes?limit=50');
      return RecipeResponseDto.fromJson(response);
    } on HttpClientError catch (e) {
      throw HttpClientError(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      throw HttpClientError(message: "unknown error");
    }
  }
}
