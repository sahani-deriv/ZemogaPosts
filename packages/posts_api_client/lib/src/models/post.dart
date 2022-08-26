import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_api_client/posts_api_client.dart';

part 'post.freezed.dart';
part 'post.g.dart';

/// {@template post}
/// A model that represents the favorite post of the user.
/// {@endtemplate}
@freezed
class Post with _$Post {
  ///{@macro post}
  @HiveType(typeId: 2, adapterName: 'PostAdapter')
  factory Post({
    @HiveField(0) required final PostData postData,
    @HiveField(1) required final List<PostComment> postComments,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
