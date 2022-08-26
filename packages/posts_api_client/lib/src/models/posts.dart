import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts.freezed.dart';
part 'posts.g.dart';

/// {@template post}
/// A model that represents the posts data.
/// {@endtemplate}
@freezed
class Post with _$Post {
  /// {@macro post}
  factory Post({
    required final int userId,
    required final int id,
    required final String title,
    required final String body,
  }) = _Post;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
