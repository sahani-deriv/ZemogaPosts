import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comment.freezed.dart';
part 'post_comment.g.dart';

///{@template post_comment}
/// A Dart Class that represents a comment data of a post.
/// {@endtemplate}
@freezed
class PostComment with _$PostComment {
  ///{@macro post_comment}
  factory PostComment({
    required final int postId,
    required final int id,
    required final String name,
    required final String email,
    required final String body,
  }) = _PostComment;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory PostComment.fromJson(Map<String, dynamic> json) =>
      _$PostCommentFromJson(json);
}
