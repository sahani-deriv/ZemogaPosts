import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';

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
  void addPostToFavorites({required Post post}) {
    _localApiClient.deletePost(post.id.toString());
    return _localApiClient.addPostToFavorites(post);
  }

  @override
  void deleteAllPosts() {
    return _localApiClient.deleteAllPosts();
  }

  @override
  VoidResult deletePost({required String postId}) {
    try {
      _localApiClient.deletePost(postId);
      return const Result.success(null);
    } on NoElementException {
      return Result.failure(
        PostsFailure('No post found with the given id.'),
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
        PostsFailure('No favorite posts found'),
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
      return Result.failure(PostsFailure("Couldn't fetch posts."));
    }
  }

  @override
  VoidResult removeFromFavorites({required Post post}) {
    try {
      _localApiClient
        ..removeFromFavorites(post.id.toString())
        ..addPost(post);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(
        PostsFailure("Couldn't remove post from favorites."),
      );
    }
  }

  @override
  Future<GetCommentsByIdResult> getCommentsById({required int postId}) async {
    try {
      if (_localApiClient.getCommentsByPostId(postId).isEmpty) {
        final comments =
            await _remoteApiClient.getCommentsByPost(postId: postId.toString());
        _localApiClient.addComment(comments: comments, postId: postId);
      }
      return Result.success(_localApiClient.getCommentsByPostId(postId));
    } catch (e) {
      return Result.failure(
        PostsFailure('Error fetching comments for the post.'),
      );
    }
  }

  @override
  Future<GetPostsResult> refetchPosts() async {
    try {
      _localApiClient.deleteAllPosts();
      final posts = await _remoteApiClient.getAllPosts();
      for (final post in posts) {
        _localApiClient.addPost(post);
      }
      return Result.success(_localApiClient.getAllPosts());
    } catch (e) {
      return Result.failure(PostsFailure("Couldn't fetch posts."));
    }
  }
}
