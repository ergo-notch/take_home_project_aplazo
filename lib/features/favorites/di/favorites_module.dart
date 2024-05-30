import 'package:get_it/get_it.dart';
import 'package:take_home_project/features/favorites/domain/usecases/add_favorite_recipe_use_case.dart';
import 'package:take_home_project/features/favorites/domain/usecases/delete_favorite_recipe_use_case.dart';
import 'package:take_home_project/features/favorites/domain/usecases/get_favorite_recipes_use_case.dart';
import 'package:take_home_project/features/favorites/presentation/bloc/favorites_recipes_bloc.dart';
import 'package:take_home_project/features/search_recipes/data/datasources/local/recipes_local_data_source_impl.dart';
import 'package:take_home_project/features/search_recipes/data/datasources/remote/recipe_remote_data_source_impl.dart';
import 'package:take_home_project/features/search_recipes/data/repositories/recipe_repository_impl.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/local/recipes_local_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/datasources/remote/recipes_remote_data_source.dart';
import 'package:take_home_project/features/search_recipes/domain/repositories/recipes_repository.dart';
import 'package:take_home_project/features/search_recipes/domain/usecases/get_recipes_use_case.dart';
import 'package:take_home_project/features/search_recipes/domain/usecases/search_recipes_use_case.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/seach_recipes_bloc.dart';

final sl = GetIt.instance;

Future<void> initModule() async {
  //UseCases
  sl.registerLazySingleton(() => GetFavoriteRecipesUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddFavoriteRecipeUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteFavoriteRecipeUseCase(repository: sl()));

  //State management
  sl.registerLazySingleton(() => FavoritesRecipesBloc(
      getFavoriteRecipesUseCase: sl(),
      addFavoriteRecipeUseCase: sl(),
      deleteFavoriteRecipeUseCase: sl()));
}
