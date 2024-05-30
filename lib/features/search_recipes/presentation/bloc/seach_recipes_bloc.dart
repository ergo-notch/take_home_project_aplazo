import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/usecases/get_recipes_use_case.dart';
import 'package:take_home_project/features/search_recipes/domain/usecases/search_recipes_use_case.dart';

import 'search_recipes_events.dart';
import 'search_recipes_state.dart';

class SearchRecipesBloc extends Bloc<SearchRecipesEvent, SearchRecipesState> {
  GetRecipesUseCase getRecipesUseCase;
  SearchRecipesUseCase searchRecipesUseCase;

  SearchRecipesBloc(
      {required this.getRecipesUseCase, required this.searchRecipesUseCase})
      : super(const SearchRecipesState()) {
    on<GetRecipesEvent>(_getRecipes);
    on<FetchedRecipesEvent>(_fetchedRecipes);
    on<FailedGetRecipesEvent>(_failedGetRecipes);
    on<SearchRecipesByStringEvent>(_searchRecipesByString);
    on<ShowSearchResultsEvent>(_showSearchResultsEvent);
    on<ClearSearchEvent>(_clearSearchEvent);
  }

  Future<void> _getRecipes(event, emit) async {
    emit(state.copyWith(status: PostStatus.fetching));
    final result = await getRecipesUseCase.call(NoParams());
    result.fold(
        (failure) => add(FailedGetRecipesEvent(errorMessage: failure.message)),
        (success) => add(FetchedRecipesEvent(recipes: success)));
  }

  void _fetchedRecipes(FetchedRecipesEvent event, emit) => emit(state.copyWith(
      status: PostStatus.success,
      recipes: event.recipes,
      filteredRecipes: event.recipes));

  void _failedGetRecipes(FailedGetRecipesEvent event, emit) =>
      emit(state.copyWith(
        status: PostStatus.failure,
        errorMessage: event.errorMessage,
      ));

  Future<void> _searchRecipesByString(
      SearchRecipesByStringEvent event, emit) async {
    final result = await searchRecipesUseCase.call(SearchRecipesUseCaseParams(
        searchText: event.searchText, recipes: state.recipes));
    result.fold((failure) {},
        (success) => add(ShowSearchResultsEvent(recipes: success)));
  }

  void _showSearchResultsEvent(ShowSearchResultsEvent event, emit) {
    emit(state.copyWith(filteredRecipes: event.recipes));
  }

  void _clearSearchEvent(ClearSearchEvent event, emit) {
    emit(state.copyWith(filteredRecipes: state.recipes));
  }
}
