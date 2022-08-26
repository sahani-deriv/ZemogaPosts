import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post_comment.freezed.dart';
part 'post_comment.g.dart';

///{@template post_comment}
/// A Dart Class that represents a comment data of a post.
/// {@endtemplate}
@freezed
class PostComment with _$PostComment {
  ///{@macro post_comment}
  @HiveType(typeId: 1, adapterName: 'PostCommentAdapter')
  factory PostComment({
    @HiveField(0) required final int postId,
    @HiveField(1) required final int id,
    @HiveField(2) required final String name,
    @HiveField(3) required final String email,
    @HiveField(4) required final String body,
  }) = _PostComment;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory PostComment.fromJson(Map<String, dynamic> json) =>
      _$PostCommentFromJson(json);
}
