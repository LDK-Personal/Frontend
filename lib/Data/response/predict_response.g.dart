// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictResponseImpl _$$PredictResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictResponseImpl(
      emotion: json['emotion'] as String,
      probability: json['probability'] as String,
      file_path: json['file_path'] as String,
    );

Map<String, dynamic> _$$PredictResponseImplToJson(
        _$PredictResponseImpl instance) =>
    <String, dynamic>{
      'emotion': instance.emotion,
      'probability': instance.probability,
      'file_path': instance.file_path,
    };
