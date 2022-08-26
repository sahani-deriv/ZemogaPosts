import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_api_client/src/models/models.dart';
import 'package:posts_api_client/src/posts_local_api_client.dart';

class MockHive extends Mock implements HiveInterface {}

class MockPostBox<Post> extends Mock implements Box<Post> {}

class MockCommentBox<Comment> extends Mock implements Box<PostComment> {}

class MockFavoriteBox<FavoritePost> extends Mock implements Box<FavoritePost> {}

void main() {
  group('PostsLocalApiClient', () {
    late HiveInterface _mockHive;
    late Box<Post> _postBox;
    late Box<PostComment> _commentBox;
    late Box<FavoritePost> _favoriteBox;
    late PostsLocalApiClient _api;

    setUp(() {
      _mockHive = MockHive();
      _postBox = MockPostBox<Post>();
      _commentBox = MockCommentBox<PostComment>();
      _favoriteBox = MockFavoriteBox<FavoritePost>();

      when(() => _mockHive.openBox<Post>('posts')).thenAnswer(
        (_) async => _postBox,
      );
      when(() => _mockHive.box<Post>('posts')).thenReturn(_postBox);
      when(() => _mockHive.openBox<PostComment>(any())).thenAnswer(
        (_) async => _commentBox,
      );
      when(() => _mockHive.box<PostComment>(any())).thenReturn(_commentBox);

      when(() => _mockHive.openBox<FavoritePost>(any())).thenAnswer(
        (_) async => _favoriteBox,
      );
      when(() => _mockHive.box<FavoritePost>(any())).thenReturn(_favoriteBox);
      _api = PostsLocalApiClient(
        hive: _mockHive,
      );
    });

    test('instantiates', () {
      expect(_api, isA<PostsLocalApiClient>());
    });
  });
}
