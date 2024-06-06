import 'package:dio/dio.dart';
import 'package:flutter_login/Data/network/api_client.dart';
import 'package:flutter_login/Data/network/api_service.dart';
import 'package:flutter_login/Data/repository/api_repository_imp.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/local/app_preferences.dart';

final it = GetIt.instance;

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  it.registerLazySingleton<AppPreferences>(() => AppPreferences(sharedPreferences));

  // Http 요청 처리 등록
  var baseApiClient = ApiClient(enableLogging: true);

  // Dio 등록 [ApiClient에서 생성한 apiProvider가 가지고 있는 Dio]
  it.registerFactory<Dio>(() => baseApiClient.apiProvider.getDio);

  // 실제 RestFul API 처리 서비스 등록
  it.registerFactory<ApiService>(() => ApiService(it<Dio>()));

  it.registerLazySingleton<ApiRepository>(() => ApiRepositoryImp(apiService: it<ApiService>()));
}
