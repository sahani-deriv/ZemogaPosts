import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_api_client/posts_api_client.dart';

///{@template posts_local-api_client}
///A Dart API Client for caching posts.
///{@endtemplate}
class PostsLocalApiClient {
  ///{@macro posts_local_api_client}
  PostsLocalApiClient({required HiveInterface hive}) : _hive = hive {
    _openHiveBoxes();
  }

  final HiveInterface _hive;

  ///Opens all the hive boxes
  Future<void> _openHiveBoxes() async {
    await _hive.openBox<Post>('posts');
    await _hive.openBox<Post>('favorites');
  }

  /// Adds item to the hive box
  void _addToBox<T>(T item, String boxName, int key) {
    _hive.box<T>(boxName).put(key, item);
  }

  /// Adds post to the hive box
  void addPost(Post post) => _addToBox(post, 'posts', post.postData.id);

  /// Adds favorite posts to the hive box
  void addPostToFavorites(Post post) =>
      _addToBox(post, 'favorites', post.postData.id);

  /// Returns all the posts from the hive box
  List<Post> getAllPosts() => _hive.box<Post>('posts').values.toList();

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
          .firstWhere((element) => element.postData.id.toString() == postId);

      /// key was set while adding data to the box
      final key = postToBeDeleted.postData.id;
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
          .firstWhere((element) => element.postData.id.toString() == postId);
      await _hive.box<Post>('favorites').delete(postToBeDeleted);
    } catch (e) {
      throw NoElementException();
    }
  }
}
