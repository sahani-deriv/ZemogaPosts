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
    await _hive.openBox<PostComment>('comments');
    await _hive.openBox<FavoritePost>('favorites');
  }

  /// Adds item to the hive box
  void _addToBox<T>(T item, String boxName) {
    _hive.box<T>(boxName).add(item);
  }

  /// Adds post to the hive box
  void addPost(List<Post> posts) => _addToBox(posts, 'posts');

  /// Adds favorite posts to the hive box
  void addPostToFavorites(FavoritePost post) => _addToBox(post, 'favorites');

  /// Adds post comments to the hive box
  void addPostComment(List<PostComment> comments) {
    _addToBox(comments, 'comments');
  }

  /// Returns all the posts from the hive box
  List<Post> getAllPosts() => _hive.box<Post>('posts').values.toList();

  /// Returns all the comments from the hive box
  List<PostComment> getAllPostComments() =>
      _hive.box<PostComment>('comments').values.toList();

  /// Returns all the favorite posts from the hive box
  List<FavoritePost> getAllFavoritePosts() =>
      _hive.box<FavoritePost>('favorites').values.toList();

  /// Returns the favorite post of the given id
  void deleteAllPosts() => _hive.box<Post>('posts').clear();

  /// Returns the favorite post of the given id
  Future<void> deletePost(String postId) async {
    try {
      final postToBeDeleted = _hive
          .box<Post>('posts')
          .values
          .firstWhere((element) => element.id.toString() == postId);
      await _hive.box<Post>('posts').delete(postToBeDeleted);
    } catch (e) {
      throw NoElementException();
    }
  }
}
