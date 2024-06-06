// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardResponse _$BoardResponseFromJson(Map<String, dynamic> json) {
  return _BoardResponse.fromJson(json);
}

/// @nodoc
mixin _$BoardResponse {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardResponseCopyWith<BoardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardResponseCopyWith<$Res> {
  factory $BoardResponseCopyWith(
          BoardResponse value, $Res Function(BoardResponse) then) =
      _$BoardResponseCopyWithImpl<$Res, BoardResponse>;
  @useResult
  $Res call({int id, String userId, String title, String content});
}

/// @nodoc
class _$BoardResponseCopyWithImpl<$Res, $Val extends BoardResponse>
    implements $BoardResponseCopyWith<$Res> {
  _$BoardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardResponseImplCopyWith<$Res>
    implements $BoardResponseCopyWith<$Res> {
  factory _$$BoardResponseImplCopyWith(
          _$BoardResponseImpl value, $Res Function(_$BoardResponseImpl) then) =
      __$$BoardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String userId, String title, String content});
}

/// @nodoc
class __$$BoardResponseImplCopyWithImpl<$Res>
    extends _$BoardResponseCopyWithImpl<$Res, _$BoardResponseImpl>
    implements _$$BoardResponseImplCopyWith<$Res> {
  __$$BoardResponseImplCopyWithImpl(
      _$BoardResponseImpl _value, $Res Function(_$BoardResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$BoardResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardResponseImpl implements _BoardResponse {
  _$BoardResponseImpl(
      {required this.id,
      required this.userId,
      required this.title,
      required this.content});

  factory _$BoardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'BoardResponse(id: $id, userId: $userId, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardResponseImplCopyWith<_$BoardResponseImpl> get copyWith =>
      __$$BoardResponseImplCopyWithImpl<_$BoardResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardResponseImplToJson(
      this,
    );
  }
}

abstract class _BoardResponse implements BoardResponse {
  factory _BoardResponse(
      {required final int id,
      required final String userId,
      required final String title,
      required final String content}) = _$BoardResponseImpl;

  factory _BoardResponse.fromJson(Map<String, dynamic> json) =
      _$BoardResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$BoardResponseImplCopyWith<_$BoardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
