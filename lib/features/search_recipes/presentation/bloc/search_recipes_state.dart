import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

enum PostStatus { initial, fetching, success, failure }

class SearchRecipesState {
  const SearchRecipesState(
      {this.status = PostStatus.initial,
      this.recipes = const <RecipeEntity>[],
      this.filteredRecipes = const <RecipeEntity>[],
      this.errorMessage});

  final PostStatus status;
  final List<RecipeEntity> recipes;
  final List<RecipeEntity> filteredRecipes;
  final String? errorMessage;

  SearchRecipesState copyWith(
      {PostStatus? status,
      List<RecipeEntity>? recipes,
      List<RecipeEntity>? filteredRecipes,
      String? errorMessage}) {
    return SearchRecipesState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      filteredRecipes: filteredRecipes ?? this.filteredRecipes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
