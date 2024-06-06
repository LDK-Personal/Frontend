import 'dart:io';

import 'package:dio/src/options.dart';
import 'package:flutter_login/Data/network/api_service.dart';
import 'package:flutter_login/Data/request/board_request.dart';
import 'package:flutter_login/Data/request/login_request.dart';
import 'package:flutter_login/Data/response/board_response.dart';
import 'package:flutter_login/Data/response/predict_response.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';

class ApiRepositoryImp implements ApiRepository {
  final ApiService apiService;

  ApiRepositoryImp({required this.apiService});

  @override
  Future<bool> deleteBoardItem(int id) async {
    return await apiService.deleteBoardItem(id);
  }

  @override
  Future<BoardResponse> getBoardItem(int id) async {
    return await apiService.getBoardItem(id);
  }

  @override
  Future<List<BoardResponse>> getBoardItems() async {
    return await apiService.getBoardItems();
  }

  @override
  Future<bool> login(LoginRequest loginRequest) async {
    return await apiService.login(loginRequest.toJson());
  }

  @override
  Future<bool> register(LoginRequest loginRequest) async {
    return await apiService.register(loginRequest.toJson());
  }


  @override
  Future<PredictResponse> uploadFile(File file, ProgressCallback? onSendProgress) async {
    return await apiService.uploadFile(file, onSendProgress: onSendProgress);
  }

  @override
  Future<bool> saveBoardItem(BoardRequest boardRequest) async {
    return await apiService.saveBoardItem(boardRequest.toJson());
  }

  @override
  Future<bool> updateBoardItem(int id, BoardRequest boardRequest) async {
    return await apiService.updateBoardItem(id,boardRequest.toJson());
  }

}
