import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_login/Data/network/api_endpoint.dart';
import 'package:flutter_login/Data/response/board_response.dart';
import 'package:flutter_login/Data/response/predict_response.dart';

import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(final Dio dio) = _ApiService;

  @GET("${ApiEndpoint.publicApi}${ApiEndpoint.board}/all")
  Future<List<BoardResponse>> getBoardItems();

  @GET("${ApiEndpoint.publicApi}${ApiEndpoint.board}/{id}")
  Future<BoardResponse> getBoardItem(@Path() int id);

  @POST("${ApiEndpoint.publicApi}${ApiEndpoint.board}")
  Future<bool> saveBoardItem(@Body() Map<String, dynamic> body);

  @PUT("${ApiEndpoint.publicApi}${ApiEndpoint.board}/{id}")
  Future<bool> updateBoardItem(@Path() int id, @Body() Map<String, dynamic> body);

  @DELETE("${ApiEndpoint.publicApi}${ApiEndpoint.board}/{id}")
  Future<bool> deleteBoardItem(@Path() int id);

  @POST("${ApiEndpoint.publicApi}${ApiEndpoint.user}/register")
  Future<bool> register(@Body() Map<String, dynamic> body);

  @POST("${ApiEndpoint.publicApi}${ApiEndpoint.user}/login")
  Future<bool> login(@Body() Map<String, dynamic> body);

  @POST("${ApiEndpoint.publicApi}/predict")
  Future<PredictResponse> uploadFile(@Part() File file, {@SendProgress() ProgressCallback? onSendProgress});

}
