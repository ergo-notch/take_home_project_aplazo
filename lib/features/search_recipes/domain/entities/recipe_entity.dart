import 'package:take_home_project/features/search_recipes/domain/dtos/recipe_dto.dart';

class RecipeEntity {
  final num? id;
  final String? name;
  final num? prepTimeMinutes;
  final num? cookTimeMinutes;
  final num? servings;
  final List<String>? ingredients;
  final List<String>? steps;
  final String? difficulty;
  final String? cuisine;
  final num? caloriesPerServing;
  final num? rating;
  final num? reviewCount;
  final String? urlImage;
  final List<String>? tags;
  final List<String>? mealType;

  RecipeEntity(
      {this.id,
      this.name,
      this.prepTimeMinutes,
      this.cookTimeMinutes,
      this.servings,
      this.ingredients,
      this.steps,
      this.difficulty,
      this.cuisine,
      this.caloriesPerServing,
      this.rating,
      this.reviewCount,
      this.urlImage,
      this.tags,
      this.mealType});

  factory RecipeEntity.dtoToEntity({required RecipeDto recipeDto}) =>
      RecipeEntity(
        id: recipeDto.id,
        name: recipeDto.name,
        prepTimeMinutes: recipeDto.prepTimeMinutes,
        cookTimeMinutes: recipeDto.cookTimeMinutes,
        servings: recipeDto.servings,
        ingredients: recipeDto.ingredients,
        steps: recipeDto.steps,
        difficulty: recipeDto.difficulty,
        cuisine: recipeDto.cuisine,
        caloriesPerServing: recipeDto.caloriesPerServing,
        rating: recipeDto.rating,
        reviewCount: recipeDto.reviewCount,
        urlImage: recipeDto.image,
        tags: recipeDto.tags,
        mealType: recipeDto.mealType,
      );
}
