import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/src/core/core.dart';

/// A type representing either a [PostsFailure] or a list of type [Post].
typedef GetPostsResult = Result<PostsFailure, List<Post>>;

/// A type representing either a [PostsFailure] or a list
/// of type [Comment].
typedef GetCommentsByIdResult = Result<PostsFailure, List<Comment>>;

/// A type representing either a [PostsFailure] or a [void].
typedef VoidResult = Result<PostsFailure, void>;

/// {@template posts_repository}
/// A Dart Class which exposes methods by interacting with
/// api client to implement posts-related functionalities.
/// {@endtemplate}
abstract class PostsRepository {
  /// {@macro posts_repository}
  const PostsRepository();

  ///Fetches all the posts from the api client.
  Future<GetPostsResult> getAllPosts();

  /// Re-fetches the posts
  Future<GetPostsResult> refetchPosts();

  ///Fetches all the favorite posts from the api client.
  GetPostsResult getAllFavoritePosts();

  ///Adds a favorite post to the local database.
  void addPostToFavorites({required Post post});

  ///Deletes a post.
  VoidResult deletePost({required Post post});

  ///Deletes all the posts from the local database.
  void deleteAllPosts();

  ///Removes a favorite post from the local database.
  VoidResult removeFromFavorites({required Post post});

  /// Fetches a comment of its specific post.
  Future<GetCommentsByIdResult> getCommentsById({required int postId});
}
