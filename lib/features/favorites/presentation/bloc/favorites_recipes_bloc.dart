import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/favorites/domain/usecases/delete_favorite_recipe_use_case.dart';
import 'package:take_home_project/features/favorites/domain/usecases/get_favorite_recipes_use_case.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_event.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_state.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/search_recipes_state.dart';

import '../../domain/usecases/add_favorite_recipe_use_case.dart';

class FavoritesRecipesBloc
    extends Bloc<FavoritesRecipesEvent, FavoritesRecipesState> {
  AddFavoriteRecipeUseCase addFavoriteRecipeUseCase;
  DeleteFavoriteRecipeUseCase deleteFavoriteRecipeUseCase;
  GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;

  FavoritesRecipesBloc({
    required this.addFavoriteRecipeUseCase,
    required this.deleteFavoriteRecipeUseCase,
    required this.getFavoriteRecipesUseCase,
  }) : super(const FavoritesRecipesState()) {
    on<GetFavoritesRecipesEvent>(_getFavoriteRecipe);
    on<FetchedFavoritesRecipesEvent>(_fetchedFavoritesRecipes);
    on<FailedGetFavoritesRecipesEvent>(_failedGetFavoritesRecipe);
    on<AddFavoriteRecipeEvent>(_addFavoriteRecipe);
    on<DeleteFavoriteRecipeEvent>(_deleteFavoriteRecipe);
  }

  Future<void> _getFavoriteRecipe(GetFavoritesRecipesEvent event, emit) async {
    emit(state.copyWith(status: PostStatus.fetching));
    final result = await getFavoriteRecipesUseCase.call(NoParams());
    result.fold(
        (failure) => add(FailedGetFavoritesRecipesEvent()),
        (success) =>
            add(FetchedFavoritesRecipesEvent(favoriteRecipes: success ?? [])));
  }

  void _fetchedFavoritesRecipes(FetchedFavoritesRecipesEvent event, emit) =>
      emit(state.copyWith(
          favoritesRecipes: event.favoriteRecipes, status: PostStatus.success));

  void _failedGetFavoritesRecipe(FailedGetFavoritesRecipesEvent event, emit) =>
      emit(
          state.copyWith(status: PostStatus.failure, errorMessage: 'DB Error'));

  Future<void> _addFavoriteRecipe(AddFavoriteRecipeEvent event, emit) async {
    final result = await addFavoriteRecipeUseCase.call(event.recipeEntity);
    result.fold((failure) => add(FailedGetFavoritesRecipesEvent()),
        (success) => add(GetFavoritesRecipesEvent()));
  }

  Future<void> _deleteFavoriteRecipe(
      DeleteFavoriteRecipeEvent event, emit) async {
    final result = await deleteFavoriteRecipeUseCase.call(event.recipeEntity);
    result.fold((failure) => add(FailedGetFavoritesRecipesEvent()),
        (success) => add(GetFavoritesRecipesEvent()));
  }
}
