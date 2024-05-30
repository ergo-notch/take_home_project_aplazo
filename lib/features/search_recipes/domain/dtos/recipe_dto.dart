class RecipeDto {
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
  final String? image;
  final List<String>? tags;
  final List<String>? mealType;

  RecipeDto(
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
      this.image,
      this.tags,
      this.mealType});

  factory RecipeDto.fromJson(Map<String, dynamic> json) => RecipeDto(
        id: json['id'],
        name: json['name'],
        prepTimeMinutes: json['prepTimeMinutes'],
        cookTimeMinutes: json['cookTimeMinutes'],
        servings: json['servings'],
        ingredients: List<String>.from(json['ingredients']),
        steps: List<String>.from(json['instructions']),
        difficulty: json['difficulty'],
        cuisine: json['cuisine'],
        caloriesPerServing: json['caloriesPerServing'],
        rating: json['rating'],
        reviewCount: json['reviewCount'],
        image: json['image'],
        tags: List<String>.from(json['tags']),
        mealType: List<String>.from(json['mealType']),
      );
}
