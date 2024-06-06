// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predict_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictResponse _$PredictResponseFromJson(Map<String, dynamic> json) {
  return _PredictResponse.fromJson(json);
}

/// @nodoc
mixin _$PredictResponse {
  String get emotion => throw _privateConstructorUsedError;
  String get probability => throw _privateConstructorUsedError;
  String get file_path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictResponseCopyWith<PredictResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictResponseCopyWith<$Res> {
  factory $PredictResponseCopyWith(
          PredictResponse value, $Res Function(PredictResponse) then) =
      _$PredictResponseCopyWithImpl<$Res, PredictResponse>;
  @useResult
  $Res call({String emotion, String probability, String file_path});
}

/// @nodoc
class _$PredictResponseCopyWithImpl<$Res, $Val extends PredictResponse>
    implements $PredictResponseCopyWith<$Res> {
  _$PredictResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotion = null,
    Object? probability = null,
    Object? file_path = null,
  }) {
    return _then(_value.copyWith(
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as String,
      file_path: null == file_path
          ? _value.file_path
          : file_path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictResponseImplCopyWith<$Res>
    implements $PredictResponseCopyWith<$Res> {
  factory _$$PredictResponseImplCopyWith(_$PredictResponseImpl value,
          $Res Function(_$PredictResponseImpl) then) =
      __$$PredictResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emotion, String probability, String file_path});
}

/// @nodoc
class __$$PredictResponseImplCopyWithImpl<$Res>
    extends _$PredictResponseCopyWithImpl<$Res, _$PredictResponseImpl>
    implements _$$PredictResponseImplCopyWith<$Res> {
  __$$PredictResponseImplCopyWithImpl(
      _$PredictResponseImpl _value, $Res Function(_$PredictResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotion = null,
    Object? probability = null,
    Object? file_path = null,
  }) {
    return _then(_$PredictResponseImpl(
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as String,
      file_path: null == file_path
          ? _value.file_path
          : file_path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictResponseImpl implements _PredictResponse {
  _$PredictResponseImpl(
      {required this.emotion,
      required this.probability,
      required this.file_path});

  factory _$PredictResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictResponseImplFromJson(json);

  @override
  final String emotion;
  @override
  final String probability;
  @override
  final String file_path;

  @override
  String toString() {
    return 'PredictResponse(emotion: $emotion, probability: $probability, file_path: $file_path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictResponseImpl &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.file_path, file_path) ||
                other.file_path == file_path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emotion, probability, file_path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      __$$PredictResponseImplCopyWithImpl<_$PredictResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictResponseImplToJson(
      this,
    );
  }
}

abstract class _PredictResponse implements PredictResponse {
  factory _PredictResponse(
      {required final String emotion,
      required final String probability,
      required final String file_path}) = _$PredictResponseImpl;

  factory _PredictResponse.fromJson(Map<String, dynamic> json) =
      _$PredictResponseImpl.fromJson;

  @override
  String get emotion;
  @override
  String get probability;
  @override
  String get file_path;
  @override
  @JsonKey(ignore: true)
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
