

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_login/Data/request/board_request.dart';
import 'package:flutter_login/Data/request/login_request.dart';
import 'package:flutter_login/Data/response/board_response.dart';
import 'package:flutter_login/Data/response/predict_response.dart';

abstract class ApiRepository {
  //유저 등록
  Future<bool> login(LoginRequest loginRequest);
  //유저 로그인
  Future<bool> register(LoginRequest loginRequest);

  //보드 모두 조회
  Future<List<BoardResponse>> getBoardItems();

  //보드 하나만 조회
  Future<BoardResponse> getBoardItem(int id);

  //보드 등록
  Future<bool> saveBoardItem(BoardRequest boardRequest);

  //보드 수정
  Future<bool> updateBoardItem(int id, BoardRequest boardRequest);

  //보드 삭제
  Future<bool> deleteBoardItem(int id);

  //인공지능
  Future<PredictResponse> uploadFile(File file, ProgressCallback? onSendProgress);
}