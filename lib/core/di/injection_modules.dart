import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:take_home_project/core/local_storage/isar_service.dart';
import 'package:take_home_project/core/network/http-client/http_client_service_impl.dart';
import '../network/http-client/http_client_service.dart';

import 'package:take_home_project/core/network/network_module.dart';
import 'package:take_home_project/features/favorites/di/favorites_module.dart'
    as favorites;
import '../../features/search_recipes/di/search_recipes_module.dart'
    as search_recipes_module;

final sl = GetIt.instance;

Future<void> init() async {
  //=======================
  // Network
  //=======================
  sl.registerSingleton<Dio>(NetworkModule.provideDio());
  sl.registerSingletonAsync<Isar>(() async => IsarService.provideIsar());

  sl.registerLazySingleton<HttpClientService>(
      () => HttpClientServiceImpl(dio: sl<Dio>()));

  search_recipes_module.initModule();
  favorites.initModule();
}
