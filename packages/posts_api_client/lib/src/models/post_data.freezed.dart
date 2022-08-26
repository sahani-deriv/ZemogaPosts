// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return _PostData.fromJson(json);
}

/// @nodoc
mixin _$PostData {
  @HiveField(0)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDataCopyWith<PostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDataCopyWith<$Res> {
  factory $PostDataCopyWith(PostData value, $Res Function(PostData) then) =
      _$PostDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) String body});
}

/// @nodoc
class _$PostDataCopyWithImpl<$Res> implements $PostDataCopyWith<$Res> {
  _$PostDataCopyWithImpl(this._value, this._then);

  final PostData _value;
  // ignore: unused_field
  final $Res Function(PostData) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostDataCopyWith<$Res> implements $PostDataCopyWith<$Res> {
  factory _$$_PostDataCopyWith(
          _$_PostData value, $Res Function(_$_PostData) then) =
      __$$_PostDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int userId,
      @HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) String body});
}

/// @nodoc
class __$$_PostDataCopyWithImpl<$Res> extends _$PostDataCopyWithImpl<$Res>
    implements _$$_PostDataCopyWith<$Res> {
  __$$_PostDataCopyWithImpl(
      _$_PostData _value, $Res Function(_$_PostData) _then)
      : super(_value, (v) => _then(v as _$_PostData));

  @override
  _$_PostData get _value => super._value as _$_PostData;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_PostData(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'PostDataAdapter')
class _$_PostData implements _PostData {
  _$_PostData(
      {@HiveField(0) required this.userId,
      @HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required this.body});

  factory _$_PostData.fromJson(Map<String, dynamic> json) =>
      _$$_PostDataFromJson(json);

  @override
  @HiveField(0)
  final int userId;
  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String body;

  @override
  String toString() {
    return 'PostData(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostData &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_PostDataCopyWith<_$_PostData> get copyWith =>
      __$$_PostDataCopyWithImpl<_$_PostData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDataToJson(
      this,
    );
  }
}

abstract class _PostData implements PostData {
  factory _PostData(
      {@HiveField(0) required final int userId,
      @HiveField(1) required final int id,
      @HiveField(2) required final String title,
      @HiveField(3) required final String body}) = _$_PostData;

  factory _PostData.fromJson(Map<String, dynamic> json) = _$_PostData.fromJson;

  @override
  @HiveField(0)
  int get userId;
  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_PostDataCopyWith<_$_PostData> get copyWith =>
      throw _privateConstructorUsedError;
}
