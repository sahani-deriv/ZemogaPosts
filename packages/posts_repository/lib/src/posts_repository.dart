import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/src/core/core.dart';

/// A type representing either a [ZemogaPostsFailure] or a list of type [Post].
typedef GetPostsResult = Result<ZemogaPostsFailure, List<Post>>;

/// A type representing either a [ZemogaPostsFailure] or a [void].
typedef VoidResult = Result<ZemogaPostsFailure, void>;

/// {@template posts_repository}
/// A Dart Class which exposes methods by interacting with
/// api client to implement posts-related functionalities.
/// {@endtemplate}
abstract class PostsRepository {
  /// {@macro posts_repository}
  const PostsRepository();

  ///Fetches all the posts from the api client.
  Future<GetPostsResult> getAllPosts();

  ///Fetches all the favorite posts from the api client.
  GetPostsResult getAllFavoritePosts();

  ///Adds a post to the local database.
  void addPost(Post post);

  ///Adds a favorite post to the local database.
  void addPostToFavorites(Post post);

  ///Deletes a post.
  VoidResult deletePost(String postId);

  ///Deletes all the posts from the local database.
  void deleteAllPosts();

  ///Removes a favorite post from the local database.
  Future<void> removeFromFavorites(String postId);
}
