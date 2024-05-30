import 'package:take_home_project/features/search_recipes/domain/entities/recipe_entity.dart';

enum PostStatus { initial, fetching, success, failure }

class SearchRecipesState {
  const SearchRecipesState(
      {this.status = PostStatus.initial,
      this.recipes = const <RecipeEntity>[],
      this.recipesTotal,
      this.errorMessage});

  final PostStatus status;
  final List<RecipeEntity> recipes;
  final num? recipesTotal;
  final String? errorMessage;

  SearchRecipesState copyWith(
      {PostStatus? status,
      List<RecipeEntity>? recipes,
      num? recipesTotal,
      String? errorMessage}) {
    return SearchRecipesState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      recipesTotal: recipesTotal ?? this.recipesTotal,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
