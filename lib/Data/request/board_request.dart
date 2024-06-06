
import 'package:freezed_annotation/freezed_annotation.dart';


part 'board_request.freezed.dart';
part 'board_request.g.dart';


@freezed
class BoardRequest with _$BoardRequest{
  factory BoardRequest({
    required String userId,
    required String title,
    required String content,
  }) = _BoardRequest;

  factory BoardRequest.fromJson(Map<String,dynamic> json) => _$BoardRequestFromJson(json);
}
