import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_api_client/posts_api_client.dart';

///{@template posts_local-api_client}
///A Dart API Client for caching posts.
///{@endtemplate}
class PostsLocalApiClient {
  ///{@macro posts_local_api_client}
  PostsLocalApiClient._();

  static late final HiveInterface _hive;

  ///{@macro posts_local_api_client}
  static Future<PostsLocalApiClient> init({HiveInterface? hive}) async {
    _hive = (hive ?? Hive)
      ..registerAdapter(PostAdapter())
      ..registerAdapter(CommentAdapter());
    await _hive.openBox<Post>('posts');
    await _hive.openBox<List<Comment>>('comments');
    await _hive.openBox<Post>('favorites');

    return Future.value(PostsLocalApiClient._());
  }

  /// Adds item to the hive box
  void _addToBox<T>({
    required T item,
    required String boxName,
    required int key,
  }) {
    _hive.box<T>(boxName).put(key, item);
  }

  /// Updates item in the hive box
  void updateBox<T>({
    required T item,
    required String boxName,
    required int key,
  }) {
    _hive.box<T>(boxName).put(key, item);
  }

  /// Adds post to the hive box
  void addPost(Post post) =>
      _addToBox(item: post, boxName: 'posts', key: post.id);

  /// Adds comment with its key [postId] to the hive box
  void addComment({required List<Comment> comments, required int postId}) =>
      _addToBox(item: comments, boxName: 'comments', key: postId);

  /// Adds favorite posts to the hive box
  void addPostToFavorites(Post post) =>
      _addToBox(item: post, boxName: 'favorites', key: post.id);

  /// Returns all the posts from the hive box
  List<Post> getAllPosts() => _hive.box<Post>('posts').values.toList();

  /// Returns all the comments from the hive box
  List<Comment> getCommentsByPostId(int postId) =>
      _hive.box<List<Comment>>('comments').get(postId) ?? [];

  /// Returns all the favorite posts from the hive box
  List<Post> getAllFavoritePosts() =>
      _hive.box<Post>('favorites').values.toList();

  /// Returns the favorite post of the given id
  void deleteAllPosts() => _hive.box<Post>('posts').clear();

  /// Returns the favorite post of the given id
  Future<void> deletePost(String postId) async {
    try {
      final postToBeDeleted = _hive
          .box<Post>('posts')
          .values
          .firstWhere((element) => element.id.toString() == postId);

      /// key was set while adding data to the box
      final key = postToBeDeleted.id;
      await _hive.box<Post>('posts').delete(key);
    } catch (e) {
      throw NoElementException();
    }
  }

  /// Returns the favorite post of the given id
  Future<void> removeFromFavorites(String postId) async {
    try {
      final postToBeDeleted = _hive
          .box<Post>('favorites')
          .values
          .firstWhere((element) => element.id.toString() == postId);
      await _hive.box<Post>('favorites').delete(postToBeDeleted);
    } catch (e) {
      throw NoElementException();
    }
  }
}
