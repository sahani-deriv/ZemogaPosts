import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

///{@template comment}
/// A Dart Class that represents a comment data of a post.
/// {@endtemplate}
@freezed
class Comment with _$Comment {
  ///{@macro comment}
  @HiveType(typeId: 1, adapterName: 'CommentAdapter')
  factory Comment({
    @HiveField(0) required final int id,
    @HiveField(1) required final String name,
    @HiveField(2) required final String email,
    @HiveField(3) required final String body,
  }) = _Comment;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
