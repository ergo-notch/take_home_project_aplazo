import 'package:get_it/get_it.dart';
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
  //DataSource
  sl.registerFactory<RecipesRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(client: sl()));

  sl.registerFactory<RecipesLocalDataSource>(
      () => RecipesLocalDataSourceImpl(isar: sl()));

  //Repository
  sl.registerFactory<RecipesRepository>(
    () => RecipeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  //UseCases
  sl.registerLazySingleton(() => GetRecipesUseCase(recipesRepository: sl()));
  sl.registerLazySingleton(() => SearchRecipesUseCase());

  //State management
  sl.registerLazySingleton(() =>
      SearchRecipesBloc(getRecipesUseCase: sl(), searchRecipesUseCase: sl()));
}
