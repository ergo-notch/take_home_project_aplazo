import 'package:equatable/equatable.dart';

import '../../domain/entities/recipe_entity.dart';

sealed class SearchRecipesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetRecipesEvent extends SearchRecipesEvent {}

class FetchedRecipesEvent extends SearchRecipesEvent {
  final List<RecipeEntity>? recipes;

  FetchedRecipesEvent({required this.recipes});
}

class FailedGetRecipesEvent extends SearchRecipesEvent {
  final String? errorMessage;

  FailedGetRecipesEvent({required this.errorMessage});
}
