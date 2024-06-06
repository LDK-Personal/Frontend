
import 'package:freezed_annotation/freezed_annotation.dart';


part 'predict_response.freezed.dart';
part 'predict_response.g.dart';

/// 로그인 요청 응답
@freezed
class PredictResponse with _$PredictResponse {
  factory PredictResponse({
    required String emotion,
    required String probability,
    required String file_path,
  }) = _PredictResponse;

  factory PredictResponse.fromJson(Map<String,dynamic> json) => _$PredictResponseFromJson(json);
}
