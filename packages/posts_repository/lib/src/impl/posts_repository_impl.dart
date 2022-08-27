import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:posts_repository/src/core/failure.dart';
import 'package:posts_repository/src/core/result.dart';

///{@template posts_repository}
/// An implementation of [PostsRepository].
///{@endtemplate}
class PostRepositoryImpl implements PostsRepository {
  ///{@macro posts_repository}
  PostRepositoryImpl({
    required PostsRemoteApiClient postsRemoteApiClient,
    required PostsLocalApiClient localApiClient,
  })  : _remoteApiClient = postsRemoteApiClient,
        _localApiClient = localApiClient;

  final PostsRemoteApiClient _remoteApiClient;
  final PostsLocalApiClient _localApiClient;

  @override
  void addPost(Post post) {
    return _localApiClient.addPost(post);
  }

  @override
  void addPostToFavorites(Post post) {
    return _localApiClient.addPostToFavorites(post);
  }

  @override
  void deleteAllPosts() {
    return _localApiClient.deleteAllPosts();
  }

  @override
  VoidResult deletePost(String postId) {
    try {
      _localApiClient.deletePost(postId);
      return const Result.success(null);
    } on NoElementException {
      return Result.failure(
        ZemogaPostsFailure('No post found with id $postId'),
      );
    }
  }

  @override
  GetPostsResult getAllFavoritePosts() {
    try {
      final posts = _localApiClient.getAllFavoritePosts();
      return Result.success(posts);
    } catch (e) {
      return Result.failure(
        ZemogaPostsFailure('No favorite posts found'),
      );
    }
  }

  @override
  Future<GetPostsResult> getAllPosts() async {
    try {
      if ((_localApiClient.getAllPosts()).isEmpty) {
        final posts = await _remoteApiClient.getAllPosts();
        for (final post in posts) {
          _localApiClient.addPost(post);
        }
      }
      return Result.success(_localApiClient.getAllPosts());
    } catch (e) {
      return Result.failure(ZemogaPostsFailure("Couldn't fetch posts."));
    }
  }

  @override
  Future<void> removeFromFavorites(String postId) {
    return _localApiClient.removeFromFavorites(postId);
  }
}
