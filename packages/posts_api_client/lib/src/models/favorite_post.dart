import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_api_client/posts_api_client.dart';

part 'favorite_post.freezed.dart';
part 'favorite_post.g.dart';

/// {@template favorite_post}
/// A model that represents the favorite post of the user.
/// {@endtemplate}
@freezed
class FavoritePost with _$FavoritePost {
  ///{@macro favorite_post}
  @HiveType(typeId: 2, adapterName: 'FavoritePostAdapter')
  factory FavoritePost({
    @HiveField(0) required final Post post,
    @HiveField(1) required final List<PostComment> postComments,
  }) = _FavoritePost;

  factory FavoritePost.fromJson(Map<String, dynamic> json) =>
      _$FavoritePostFromJson(json);
}
