import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:take_home_project/core/network/http-client/http_client_service_impl.dart';
import 'package:take_home_project/core/network/network_module.dart';

import '../../features/search_recipes/di/search_recipes_module.dart'
    as search_recipes_module;
import '../network/http-client/http_client_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //=======================
  // Network
  //=======================
  sl.registerSingleton<Dio>(NetworkModule.provideDio());

  sl.registerLazySingleton<HttpClientService>(
      () => HttpClientServiceImpl(dio: sl<Dio>()));

  search_recipes_module.initModule();
}
