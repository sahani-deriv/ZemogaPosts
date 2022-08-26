// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @HiveField(0)
  PostData get postData => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PostComment> get postComments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) PostData postData,
      @HiveField(1) List<PostComment> postComments});

  $PostDataCopyWith<$Res> get postData;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? postData = freezed,
    Object? postComments = freezed,
  }) {
    return _then(_value.copyWith(
      postData: postData == freezed
          ? _value.postData
          : postData // ignore: cast_nullable_to_non_nullable
              as PostData,
      postComments: postComments == freezed
          ? _value.postComments
          : postComments // ignore: cast_nullable_to_non_nullable
              as List<PostComment>,
    ));
  }

  @override
  $PostDataCopyWith<$Res> get postData {
    return $PostDataCopyWith<$Res>(_value.postData, (value) {
      return _then(_value.copyWith(postData: value));
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) PostData postData,
      @HiveField(1) List<PostComment> postComments});

  @override
  $PostDataCopyWith<$Res> get postData;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? postData = freezed,
    Object? postComments = freezed,
  }) {
    return _then(_$_Post(
      postData: postData == freezed
          ? _value.postData
          : postData // ignore: cast_nullable_to_non_nullable
              as PostData,
      postComments: postComments == freezed
          ? _value._postComments
          : postComments // ignore: cast_nullable_to_non_nullable
              as List<PostComment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'PostAdapter')
class _$_Post implements _Post {
  _$_Post(
      {@HiveField(0) required this.postData,
      @HiveField(1) required final List<PostComment> postComments})
      : _postComments = postComments;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  @HiveField(0)
  final PostData postData;
  final List<PostComment> _postComments;
  @override
  @HiveField(1)
  List<PostComment> get postComments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postComments);
  }

  @override
  String toString() {
    return 'Post(postData: $postData, postComments: $postComments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.postData, postData) &&
            const DeepCollectionEquality()
                .equals(other._postComments, _postComments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postData),
      const DeepCollectionEquality().hash(_postComments));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {@HiveField(0) required final PostData postData,
      @HiveField(1) required final List<PostComment> postComments}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  @HiveField(0)
  PostData get postData;
  @override
  @HiveField(1)
  List<PostComment> get postComments;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
