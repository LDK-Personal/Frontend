// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardResponseImpl _$$BoardResponseImplFromJson(Map<String, dynamic> json) =>
    _$BoardResponseImpl(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$BoardResponseImplToJson(_$BoardResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
    };
