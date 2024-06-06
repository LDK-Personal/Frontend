
import 'package:dio/dio.dart';
import 'package:flutter_login/Data/network/api_endpoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



abstract class ApiProviderFactory {
  Dio get getDio;

  factory ApiProviderFactory(bool enableLogger,
      {BaseOptions? options}) {
    return ApiProvider(enableLogger, options: options);
  }
}

/// 기본 RestFul API
/// Basic RestFul API
class ApiProvider implements ApiProviderFactory {
  static const int apiTimeOut = 60000;
  static late Dio dio;

  bool enableLogger;

  ApiProvider(this.enableLogger, {BaseOptions? options}) {
    final dioInstance = Dio(options ?? BaseOptions()
      ..baseUrl = ApiEndpoint.baseUrl
      ..connectTimeout = const Duration(milliseconds: apiTimeOut)
      ..receiveTimeout = const Duration(milliseconds: apiTimeOut)
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'accept': 'application/json',
      });

    if (enableLogger) {
      dioInstance.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }

    dio = dioInstance;
  }

  @override
  Dio get getDio => dio;
}
