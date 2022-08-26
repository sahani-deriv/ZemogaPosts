// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoritePost _$FavoritePostFromJson(Map<String, dynamic> json) {
  return _FavoritePost.fromJson(json);
}

/// @nodoc
mixin _$FavoritePost {
  @HiveField(0)
  Post get post => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PostComment> get postComments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritePostCopyWith<FavoritePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritePostCopyWith<$Res> {
  factory $FavoritePostCopyWith(
          FavoritePost value, $Res Function(FavoritePost) then) =
      _$FavoritePostCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) Post post, @HiveField(1) List<PostComment> postComments});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class _$FavoritePostCopyWithImpl<$Res> implements $FavoritePostCopyWith<$Res> {
  _$FavoritePostCopyWithImpl(this._value, this._then);

  final FavoritePost _value;
  // ignore: unused_field
  final $Res Function(FavoritePost) _then;

  @override
  $Res call({
    Object? post = freezed,
    Object? postComments = freezed,
  }) {
    return _then(_value.copyWith(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      postComments: postComments == freezed
          ? _value.postComments
          : postComments // ignore: cast_nullable_to_non_nullable
              as List<PostComment>,
    ));
  }

  @override
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc
abstract class _$$_FavoritePostCopyWith<$Res>
    implements $FavoritePostCopyWith<$Res> {
  factory _$$_FavoritePostCopyWith(
          _$_FavoritePost value, $Res Function(_$_FavoritePost) then) =
      __$$_FavoritePostCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) Post post, @HiveField(1) List<PostComment> postComments});

  @override
  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$$_FavoritePostCopyWithImpl<$Res>
    extends _$FavoritePostCopyWithImpl<$Res>
    implements _$$_FavoritePostCopyWith<$Res> {
  __$$_FavoritePostCopyWithImpl(
      _$_FavoritePost _value, $Res Function(_$_FavoritePost) _then)
      : super(_value, (v) => _then(v as _$_FavoritePost));

  @override
  _$_FavoritePost get _value => super._value as _$_FavoritePost;

  @override
  $Res call({
    Object? post = freezed,
    Object? postComments = freezed,
  }) {
    return _then(_$_FavoritePost(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      postComments: postComments == freezed
          ? _value._postComments
          : postComments // ignore: cast_nullable_to_non_nullable
              as List<PostComment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'FavoritePostAdapter')
class _$_FavoritePost implements _FavoritePost {
  _$_FavoritePost(
      {@HiveField(0) required this.post,
      @HiveField(1) required final List<PostComment> postComments})
      : _postComments = postComments;

  factory _$_FavoritePost.fromJson(Map<String, dynamic> json) =>
      _$$_FavoritePostFromJson(json);

  @override
  @HiveField(0)
  final Post post;
  final List<PostComment> _postComments;
  @override
  @HiveField(1)
  List<PostComment> get postComments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postComments);
  }

  @override
  String toString() {
    return 'FavoritePost(post: $post, postComments: $postComments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritePost &&
            const DeepCollectionEquality().equals(other.post, post) &&
            const DeepCollectionEquality()
                .equals(other._postComments, _postComments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(post),
      const DeepCollectionEquality().hash(_postComments));

  @JsonKey(ignore: true)
  @override
  _$$_FavoritePostCopyWith<_$_FavoritePost> get copyWith =>
      __$$_FavoritePostCopyWithImpl<_$_FavoritePost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoritePostToJson(
      this,
    );
  }
}

abstract class _FavoritePost implements FavoritePost {
  factory _FavoritePost(
          {@HiveField(0) required final Post post,
          @HiveField(1) required final List<PostComment> postComments}) =
      _$_FavoritePost;

  factory _FavoritePost.fromJson(Map<String, dynamic> json) =
      _$_FavoritePost.fromJson;

  @override
  @HiveField(0)
  Post get post;
  @override
  @HiveField(1)
  List<PostComment> get postComments;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritePostCopyWith<_$_FavoritePost> get copyWith =>
      throw _privateConstructorUsedError;
}
