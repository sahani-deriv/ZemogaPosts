import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_api_client/src/posts_local_api_client.dart';

class MockHive extends Mock implements HiveInterface {}

class MockPostBox<Post> extends Mock implements Box<Post> {}

class MockFavoriteBox<FavoritePost> extends Mock implements Box<FavoritePost> {}

final postData = PostData(
  userId: 1,
  id: 1,
  title: 'title',
  body: 'body',
);

final comment = PostComment(
  postId: 1,
  id: 1,
  name: 'name',
  email: 'email',
  body: 'body',
);

final post = Post(
  postData: postData,
  postComments: [comment],
);

void main() {
  group('PostsLocalApiClient', () {
    late HiveInterface _mockHive;
    late Box<Post> _postBox;
    late Box<Post> _favoriteBox;
    late PostsLocalApiClient _api;

    setUp(() {
      _mockHive = MockHive();
      _postBox = MockPostBox<Post>();
      _favoriteBox = MockFavoriteBox<Post>();

      when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
        (_) async => _postBox,
      );
      when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);

      when(() => _mockHive.openBox<Post>(any())).thenAnswer(
        (_) async => _favoriteBox,
      );
      when(() => _mockHive.box<Post>(any())).thenReturn(_favoriteBox);
      _api = PostsLocalApiClient(
        hive: _mockHive,
      );
    });

    test('instantiates', () {
      expect(_api, isA<PostsLocalApiClient>());
    });

    group('.addPost', () {
      test('adds post to the hive box', () async {
        when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
          (_) async => _postBox,
        );
        when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);

        when(() => _postBox.put(any<int>(), post)).thenAnswer(
          (_) async => () {},
        );
        _api.addPost(post);
        verify(() => _postBox.put(any<int>(), post)).called(1);
      });
    });

    group('.getAllPosts', () {
      test('returns all the posts from the posts hive box', () async {
        when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
          (_) async => _postBox,
        );
        when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);

        when(() => _postBox.values).thenAnswer(
          (_) => Iterable.generate(1, (i) => post),
        );
        final posts = _api.getAllPosts();
        expect(posts, equals([post]));
      });
    });

    group('.addPostToFavorites', () {
      test('adds post to the favorites hive box', () async {
        when(() => _mockHive.openBox<Post>('favorites')).thenAnswer(
          (_) async => _favoriteBox,
        );
        when(() => _mockHive.box<Post>('favorites')).thenReturn(_favoriteBox);

        when(() => _favoriteBox.put(any<int>(), post)).thenAnswer(
          (_) async => () {},
        );
        _api.addPostToFavorites(post);
        verify(() => _favoriteBox.put(any<int>(), post)).called(1);
      });
    });

    group('.getAllFavoritePosts', () {
      test('returns all the posts from the favorites hive box', () async {
        when(() => _mockHive.openBox<Post>('favorites')).thenAnswer(
          (_) async => _favoriteBox,
        );
        when(() => _mockHive.box<Post>('favorites')).thenReturn(_favoriteBox);

        when(() => _favoriteBox.values).thenAnswer(
          (_) => Iterable.generate(1, (i) => post),
        );
        final posts = _api.getAllFavoritePosts();
        expect(posts, equals([post]));
      });
    });

    group('.deletePost', () {
      test('deletes a post from hive box', () async {
        when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
          (_) async => _postBox,
        );
        when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);
        when(() => _postBox.values).thenAnswer(
          (_) => Iterable.generate(1, (i) => post),
        );

        when(() => _postBox.delete(any<String>())).thenAnswer(
          (_) async => () {},
        );
        await _api.deletePost(post.postData.id.toString());
        verify(() => _postBox.delete(any<String>())).called(1);
      });

      test('throws no element exception when key does not exist', () async {
        when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
          (_) async => _postBox,
        );
        when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);

        when(() => _postBox.delete(any<String>()))
            .thenThrow(StateError('no element'));

        expect(
          _api.deletePost(post.postData.id.toString()),
          throwsA(isA<NoElementException>()),
        );
      });
    });

    group('.removeFromFavorites', () {
      test('deletes a favorite post from hive box', () async {
        when(() => _mockHive.openBox<Post>('favorites')).thenAnswer(
          (_) async => _favoriteBox,
        );
        when(() => _mockHive.box<Post>('favorites')).thenReturn(_favoriteBox);
        when(() => _favoriteBox.values).thenAnswer(
          (_) => Iterable.generate(1, (i) => post),
        );

        when(() => _favoriteBox.delete(any<String>())).thenAnswer(
          (_) async => () {},
        );
        await _api.removeFromFavorites(post.postData.id.toString());
        verify(() => _favoriteBox.delete(any<String>())).called(1);
      });

      test('throws no element exception when key does not exist', () async {
        when(() => _mockHive.openBox<Post>('favorites')).thenAnswer(
          (_) async => _favoriteBox,
        );
        when(() => _mockHive.box<Post>('favorites')).thenReturn(_favoriteBox);

        when(() => _favoriteBox.delete(any<String>()))
            .thenThrow(StateError('no element'));

        expect(
          _api.removeFromFavorites(post.postData.id.toString()),
          throwsA(isA<NoElementException>()),
        );
      });
    });

    group('.deleteAllPosts', () {
      test('removes all the posts from the hive box', () {
        when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
          (_) async => _postBox,
        );
        when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);

        when(() => _postBox.clear()).thenAnswer((_) async => 0);

        _api.deleteAllPosts();
        verify(() => _postBox.clear()).called(1);
      });
    });
  });
}
