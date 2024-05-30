import '../recipe_dto.dart';

class RecipeResponseDto {
  final List<RecipeDto>? recipes;

  RecipeResponseDto({this.recipes});

  factory RecipeResponseDto.fromJson(Map<String, dynamic> json) {
    return RecipeResponseDto(
      recipes: List<RecipeDto>.from(
          json['recipes'].map((x) => RecipeDto.fromJson(x))),
    );
  }
}
