import 'package:isar/isar.dart';
import 'package:take_home_project/features/search_recipes/domain/dtos/recipe_dto.dart';

part 'recipe_entity.g.dart';


@collection
class RecipeEntity {
  final Id? id;
  final String? name;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final List<String>? ingredients;
  final List<String>? steps;
  final String? difficulty;
  final String? cuisine;
  final int? caloriesPerServing;
  final double? rating;
  final int? reviewCount;
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
        name: recipeDto.name,
        prepTimeMinutes: recipeDto.prepTimeMinutes?.toInt(),
        cookTimeMinutes: recipeDto.cookTimeMinutes?.toInt(),
        servings: recipeDto.servings?.toInt(),
        ingredients: recipeDto.ingredients,
        steps: recipeDto.steps,
        difficulty: recipeDto.difficulty,
        cuisine: recipeDto.cuisine,
        caloriesPerServing: recipeDto.caloriesPerServing?.toInt(),
        rating: recipeDto.rating?.toDouble(),
        reviewCount: recipeDto.reviewCount?.toInt(),
        urlImage: recipeDto.image,
        tags: recipeDto.tags,
        mealType: recipeDto.mealType,
      );
}
