// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostComment _$PostCommentFromJson(Map<String, dynamic> json) {
  return _PostComment.fromJson(json);
}

/// @nodoc
mixin _$PostComment {
  @HiveField(0)
  int get postId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String get email => throw _privateConstructorUsedError;
  @HiveField(4)
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCommentCopyWith<PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentCopyWith<$Res> {
  factory $PostCommentCopyWith(
          PostComment value, $Res Function(PostComment) then) =
      _$PostCommentCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int postId,
      @HiveField(1) int id,
      @HiveField(2) String name,
      @HiveField(3) String email,
      @HiveField(4) String body});
}

/// @nodoc
class _$PostCommentCopyWithImpl<$Res> implements $PostCommentCopyWith<$Res> {
  _$PostCommentCopyWithImpl(this._value, this._then);

  final PostComment _value;
  // ignore: unused_field
  final $Res Function(PostComment) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostCommentCopyWith<$Res>
    implements $PostCommentCopyWith<$Res> {
  factory _$$_PostCommentCopyWith(
          _$_PostComment value, $Res Function(_$_PostComment) then) =
      __$$_PostCommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int postId,
      @HiveField(1) int id,
      @HiveField(2) String name,
      @HiveField(3) String email,
      @HiveField(4) String body});
}

/// @nodoc
class __$$_PostCommentCopyWithImpl<$Res> extends _$PostCommentCopyWithImpl<$Res>
    implements _$$_PostCommentCopyWith<$Res> {
  __$$_PostCommentCopyWithImpl(
      _$_PostComment _value, $Res Function(_$_PostComment) _then)
      : super(_value, (v) => _then(v as _$_PostComment));

  @override
  _$_PostComment get _value => super._value as _$_PostComment;

  @override
  $Res call({
    Object? postId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_PostComment(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
@HiveType(typeId: 1, adapterName: 'PostCommentAdapter')
class _$_PostComment implements _PostComment {
  _$_PostComment(
      {@HiveField(0) required this.postId,
      @HiveField(1) required this.id,
      @HiveField(2) required this.name,
      @HiveField(3) required this.email,
      @HiveField(4) required this.body});

  factory _$_PostComment.fromJson(Map<String, dynamic> json) =>
      _$$_PostCommentFromJson(json);

  @override
  @HiveField(0)
  final int postId;
  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final String email;
  @override
  @HiveField(4)
  final String body;

  @override
  String toString() {
    return 'PostComment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostComment &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      __$$_PostCommentCopyWithImpl<_$_PostComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostCommentToJson(
      this,
    );
  }
}

abstract class _PostComment implements PostComment {
  factory _PostComment(
      {@HiveField(0) required final int postId,
      @HiveField(1) required final int id,
      @HiveField(2) required final String name,
      @HiveField(3) required final String email,
      @HiveField(4) required final String body}) = _$_PostComment;

  factory _PostComment.fromJson(Map<String, dynamic> json) =
      _$_PostComment.fromJson;

  @override
  @HiveField(0)
  int get postId;
  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  String get email;
  @override
  @HiveField(4)
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_PostCommentCopyWith<_$_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}
