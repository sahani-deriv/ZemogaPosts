import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

/// {@template post}
/// A model that represents the posts data.
/// {@endtemplate}
@freezed
class Post with _$Post {
  /// {@macro post}
  @HiveType(typeId: 0, adapterName: 'PostAdapter')
  factory Post({
    @HiveField(0) required final int userId,
    @HiveField(1) required final int id,
    @HiveField(2) required final String title,
    @HiveField(3) required final String body,
  }) = _Post;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
