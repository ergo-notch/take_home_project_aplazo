import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/core/usecase.dart';
import 'package:take_home_project/features/search_recipes/domain/usecases/get_recipes_use_case.dart';

import 'search_recipes_events.dart';
import 'search_recipes_state.dart';

class SearchRecipesBloc extends Bloc<SearchRecipesEvent, SearchRecipesState> {
  GetRecipesUseCase getRecipesUseCase;

  SearchRecipesBloc({required this.getRecipesUseCase})
      : super(const SearchRecipesState()) {
    on<GetRecipesEvent>(_getRecipes);
    on<FetchedRecipesEvent>(_fetchedRecipes);
    on<FailedGetRecipesEvent>(_failedGetRecipes);
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
      recipesTotal: event.recipes?.length));

  void _failedGetRecipes(FailedGetRecipesEvent event, emit) =>
      emit(state.copyWith(
        status: PostStatus.failure,
        errorMessage: event.errorMessage,
      ));
}
