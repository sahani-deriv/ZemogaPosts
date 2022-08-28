// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';

class MockRemoteApiClient extends Mock implements PostsRemoteApiClient {}

class MockLocalApiClient extends Mock implements PostsLocalApiClient {}

final posts = List.generate(
  2,
  (index) => Post(
    userId: index,
    id: index,
    title: 'Test Title',
    body: 'Test description of the post',
  ),
);

final comments = List.generate(
  2,
  (index) => Comment(
    id: index,
    email: 'Test email',
    name: 'Test name',
    body: 'Test description of the comment',
  ),
);

void main() {
  group('PostsRepository', () {
    late MockRemoteApiClient _remoteApiClient;
    late MockLocalApiClient _localApiClient;
    late PostsRepository _repository;

    setUpAll(() {
      _remoteApiClient = MockRemoteApiClient();
      _localApiClient = MockLocalApiClient();
      _repository = PostRepositoryImpl(
        postsRemoteApiClient: _remoteApiClient,
        localApiClient: _localApiClient,
      );
    });

    test('can be instantiated', () {
      expect(_repository, isNotNull);
    });

    group('.getAllPosts', () {
      test('fetches the posts', () async {
        when(() => _localApiClient.getAllPosts()).thenAnswer(
          (_) => posts,
        );
        expect(
          await _repository.getAllPosts(),
          isA<Result<PostsFailure, List<Post>>>().having(
            (p0) => p0.when(
              success: (val) => val,
              failure: (e) => PostsFailure('$e'),
            ),
            'success',
            posts,
          ),
        );
      });
      test('returns a result with failure value during exception', () async {
        when(() => _localApiClient.getAllPosts()).thenAnswer(
          (_) => [],
        );
        when(() => _remoteApiClient.getAllPosts()).thenThrow(
          InvalidRequestException(),
        );
        expect(
          await _repository.getAllPosts(),
          Result<PostsFailure, List<Post>>.failure(
            PostsFailure("Couldn't fetch posts."),
          ),
        );
      });
    });
    group('.getAllFavoritePosts', () {
      test('fetches the favorite posts', () async {
        when(() => _localApiClient.getAllFavoritePosts()).thenAnswer(
          (_) => posts,
        );
        expect(
          _repository.getAllFavoritePosts(),
          isA<Result<PostsFailure, List<Post>>>().having(
            (p0) => p0.when(
              success: (val) => val,
              failure: (e) => PostsFailure('$e'),
            ),
            'success',
            posts,
          ),
        );
      });
    });
    group('.addPostToFavorites', () {
      test('adds a post to favorite posts', () async {
        when(() => _localApiClient.deletePost(any<String>()))
            .thenAnswer((_) async => () {});
        when(() => _localApiClient.addPostToFavorites(posts.first)).thenAnswer(
          (_) => () {},
        );
        _repository.addPostToFavorites(post: posts.first);
        verify(() => _localApiClient.addPostToFavorites(posts.first)).called(1);
      });
    });
    group('.deleteAllPosts', () {
      test('deletes all the posts from posts cache', () async {
        when(() => _localApiClient.deleteAllPosts()).thenAnswer(
          (_) => () {},
        );
        _repository.deleteAllPosts();
        verify(() => _localApiClient.deleteAllPosts()).called(1);
      });
    });
    group('.deletePost', () {
      test('deletes a post from posts cache', () async {
        when(
          () => _localApiClient.getAllFavoritePosts(),
        ).thenAnswer(
          (_) => [],
        );

        when(() => _localApiClient.deletePost(any<String>())).thenAnswer(
          (_) async => () {},
        );
        expect(
          _repository.deletePost(post: posts.first),
          Result<PostsFailure, void>.success(null),
        );
      });

      test('returns result with failure value during exception', () {
        when(
          () => _localApiClient.getAllFavoritePosts(),
        ).thenAnswer(
          (_) => [],
        );

        when(() => _localApiClient.deletePost(any<String>())).thenThrow(
          NoElementException(),
        );
        expect(
          _repository.deletePost(post: posts.first),
          Result<PostsFailure, void>.failure(
            PostsFailure('No post found with the given id.'),
          ),
        );
      });
    });
    group('.removeFromFavorites', () {
      test('removes a post from favorite posts', () async {
        when(() => _localApiClient.removeFromFavorites(any<String>()))
            .thenAnswer(
          (_) async => () {},
        );
        when(() => _localApiClient.addPost(posts.first)).thenAnswer(
          (_) async => () {},
        );
        expect(
          _repository.removeFromFavorites(post: posts.first),
          Result<PostsFailure, void>.success(null),
        );
      });
      test('returns result with failure value during exception', () async {
        when(() => _localApiClient.removeFromFavorites(any<String>()))
            .thenThrow(
          NoElementException(),
        );
        expect(
          _repository.removeFromFavorites(post: posts.first),
          Result<PostsFailure, void>.failure(
            PostsFailure("Couldn't remove post from favorites."),
          ),
        );
      });
    });

    group('.getCommentsById', () {
      test('fetches the comments of the given post id', () async {
        when(() => _localApiClient.getCommentsByPostId(any<int>()))
            .thenAnswer((invocation) => comments);
        expect(
          await _repository.getCommentsById(postId: 1),
          Result<PostsFailure, List<Comment>>.success(comments),
        );
      });
      test('returns a result with failure value during exception', () async {
        when(() => _localApiClient.getCommentsByPostId(any<int>())).thenAnswer(
          (_) => [],
        );
        when(() => _remoteApiClient.getCommentsByPost(postId: '1')).thenThrow(
          InvalidRequestException(),
        );
        expect(
          await _repository.getCommentsById(postId: 1),
          Result<PostsFailure, List<Comment>>.failure(
            PostsFailure('Error fetching comments for the post.'),
          ),
        );
      });
    });

    group('.refetchPosts', () {
      test('re-fetches the posts', () async {
        when(() => _localApiClient.deleteAllPosts())
            .thenAnswer((invocation) {});
        when(() => _remoteApiClient.getAllPosts()).thenAnswer(
          (_) async => posts,
        );
        when(() => _localApiClient.getAllPosts()).thenAnswer(
          (_) => posts,
        );

        expect(
          await _repository.refetchPosts(),
          Result<PostsFailure, List<Post>>.success(posts),
        );
      });
      test('returns result with failure message', () async {
        when(() => _localApiClient.deleteAllPosts())
            .thenAnswer((invocation) {});
        when(() => _remoteApiClient.getAllPosts()).thenThrow(
          InvalidRequestException(),
        );

        expect(
          await _repository.refetchPosts(),
          Result<PostsFailure, List<Post>>.failure(
            PostsFailure("Couldn't fetch posts."),
          ),
        );
      });
    });
  });
}
