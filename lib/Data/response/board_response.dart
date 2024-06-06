
import 'package:freezed_annotation/freezed_annotation.dart';


part 'board_response.freezed.dart';
part 'board_response.g.dart';

/// 로그인 요청 응답
@freezed
class BoardResponse with _$BoardResponse {
  factory BoardResponse({
    required int id,
    required String userId,
    required String title,
    required String content,
  }) = _BoardResponse;

  factory BoardResponse.fromJson(Map<String,dynamic> json) => _$BoardResponseFromJson(json);
}
