import 'package:equatable/equatable.dart';

import '../../domain/entities/recipe_entity.dart';

sealed class SearchRecipesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetRecipesEvent extends SearchRecipesEvent {}

final class AddMoreRecipesEvent extends SearchRecipesEvent {}

class FetchedRecipesEvent extends SearchRecipesEvent {
  final List<RecipeEntity>? recipes;

  FetchedRecipesEvent({required this.recipes});
}

class FailedGetRecipesEvent extends SearchRecipesEvent {
  final String? errorMessage;

  FailedGetRecipesEvent({required this.errorMessage});
}

class SearchRecipesByStringEvent extends SearchRecipesEvent {
  final String? searchText;

  SearchRecipesByStringEvent({required this.searchText});
}

class ShowSearchResultsEvent extends SearchRecipesEvent {
  final List<RecipeEntity>? recipes;

  ShowSearchResultsEvent({required this.recipes});
}

class ClearSearchEvent extends SearchRecipesEvent {}

