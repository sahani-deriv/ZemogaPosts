import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

final posts = List.generate(
  2,
  (index) => Post(
    userId: index,
    id: index,
    title: 'Test Title',
    body: 'Test description of the post',
  ),
);
void main() {
  group('PostCubit', () {
    late PostsRepository _postsRepository;

    setUp(() {
      _postsRepository = MockPostsRepository();
    });
    group('initial state', () {
      test('state is pending during initialization', () {
        final postCubit = PostCubit(
          postsRepository: _postsRepository,
        );
        expect(
          postCubit.state,
          PostState.pending(posts: const [], favoritePosts: const []),
        );
      });
    });

    group('.getAllPosts', () {
      blocTest<PostCubit, PostState>(
        'emits success state with fetched posts on success result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.getAllPosts()).thenAnswer(
            (invocation) async =>
                Result<PostsFailure, List<Post>>.success(posts),
          );
          cubit.getAllPosts();
        },
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: const []),
          PostState.success(posts: posts, favoritePosts: const []),
        ],
      );
      blocTest<PostCubit, PostState>(
        'emits failure state with failure message on failure result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.getAllPosts()).thenAnswer(
            (invocation) async => Result<PostsFailure, List<Post>>.failure(
              PostsFailure(
                'Failure message',
              ),
            ),
          );
          cubit.getAllPosts();
        },
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: const []),
          PostState.failure(
            posts: const [],
            favoritePosts: const [],
            message: 'Failure message',
          ),
        ],
      );
    });
    group('.getAllFavoritePosts', () {
      blocTest<PostCubit, PostState>(
        'emits success state with favorite posts on success result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.getAllFavoritePosts()).thenAnswer(
            (invocation) => Result<PostsFailure, List<Post>>.success(posts),
          );
          cubit.getAllFavoritePosts();
        },
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: const []),
          PostState.success(posts: const [], favoritePosts: posts),
        ],
      );
      blocTest<PostCubit, PostState>(
        'emits failure state with failure message on failure result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.getAllFavoritePosts()).thenAnswer(
            (invocation) => Result<PostsFailure, List<Post>>.failure(
              PostsFailure(
                'Failure message',
              ),
            ),
          );
          cubit.getAllFavoritePosts();
        },
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: const []),
          PostState.failure(
            posts: const [],
            favoritePosts: const [],
            message: 'Failure message',
          ),
        ],
      );
    });
    group('.removePostFromFavorites', () {
      blocTest<PostCubit, PostState>(
        'emits success state with updated favorites list',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(
            () => _postsRepository.removeFromFavorites(
              post: posts.first,
            ),
          ).thenAnswer(
            (invocation) => const Result.success(null),
          );
          cubit.removePostFromFavorites(post: posts.first);
        },
        seed: () => PostState.success(posts: const [], favoritePosts: posts),
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: posts),
          PostState.success(
            posts: [posts.first],
            favoritePosts: posts
              ..remove(
                posts.first,
              ),
          ),
        ],
      );
      blocTest<PostCubit, PostState>(
        'emits failure state with failure message on failure result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          final posts = List.generate(
            2,
            (index) => Post(
              userId: index,
              id: index,
              title: 'Test Title',
              body: 'Test description of the post',
            ),
          );
          when(
            () => _postsRepository.removeFromFavorites(
              post: posts.first,
            ),
          ).thenAnswer(
            (invocation) => Result.failure(
              PostsFailure(
                'Failure message',
              ),
            ),
          );
          cubit.removePostFromFavorites(post: posts.first);
        },
        seed: () => PostState.success(posts: const [], favoritePosts: posts),
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: posts),
          PostState.failure(
            posts: const [],
            favoritePosts: posts,
            message: 'Failure message',
          ),
        ],
      );
    });
    group('.deletePost', () {
      final postList = List.generate(
        2,
        (index) => Post(
          userId: index,
          id: index,
          title: 'Test Title',
          body: 'Test description of the post',
        ),
      );
      blocTest<PostCubit, PostState>(
        'emits success state with updated post list',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(
            () => _postsRepository.deletePost(
              postId: postList.first.id.toString(),
            ),
          ).thenAnswer(
            (invocation) => const Result.success(null),
          );
          cubit.deletePost(post: postList.first);
        },
        seed: () => PostState.success(posts: postList, favoritePosts: const []),
        expect: () => <PostState>[
          PostState.pending(posts: postList, favoritePosts: const []),
          PostState.success(
            posts: postList..remove(postList.first),
            favoritePosts: const [],
          ),
        ],
      );
      blocTest<PostCubit, PostState>(
        'emits failure state with failure message on failure result',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          final posts = List.generate(
            2,
            (index) => Post(
              userId: index,
              id: index,
              title: 'Test Title',
              body: 'Test description of the post',
            ),
          );
          when(
            () => _postsRepository.deletePost(
              postId: posts.first.id.toString(),
            ),
          ).thenAnswer(
            (invocation) => Result.failure(
              PostsFailure(
                'Failure message',
              ),
            ),
          );
          cubit.deletePost(post: posts.first);
        },
        seed: () => PostState.success(posts: posts, favoritePosts: const []),
        expect: () => <PostState>[
          PostState.pending(posts: posts, favoritePosts: const []),
          PostState.failure(
            posts: posts,
            favoritePosts: const [],
            message: 'Failure message',
          ),
        ],
      );
    });
    group('.addPostToFavorites', () {
      final posts = List.generate(
        2,
        (index) => Post(
          userId: index,
          id: index,
          title: 'Test Title',
          body: 'Test description of the post',
        ),
      );

      final post = Post(
        userId: 0,
        id: 0,
        title: 'Test Title',
        body: 'Test description of the post',
      );
      blocTest<PostCubit, PostState>(
        'emits success state with updated favorites list',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.addPostToFavorites(post: post))
              .thenAnswer(
            (invocation) => () {},
          );
          cubit.addPostToFavorites(post: post);
        },
        seed: () => PostState.success(posts: const [], favoritePosts: posts),
        expect: () => <PostState>[
          PostState.pending(posts: const [], favoritePosts: posts),
          PostState.success(
            posts: const [],
            favoritePosts: posts
              ..add(
                post,
              ),
          ),
        ],
      );
    });
    group('.deleteAllPosts', () {
      blocTest<PostCubit, PostState>(
        'emits success state with empty posts list',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.deleteAllPosts()).thenAnswer(
            (invocation) => () {},
          );
          cubit.deleteAllPosts();
        },
        seed: () => PostState.success(posts: posts, favoritePosts: const []),
        expect: () => <PostState>[
          PostState.pending(posts: posts, favoritePosts: const []),
          PostState.success(
            posts: const [],
            favoritePosts: const [],
          ),
        ],
      );
    });
    group('.getCommentsByPost', () {
      final comments = List.generate(
        2,
        (index) => Comment(
          id: index,
          email: 'Test email',
          name: 'Test name',
          body: 'Test description of the comment',
        ),
      );
      blocTest<PostCubit, PostState>(
        'emits success state with comments of the selected post',
        build: () {
          return PostCubit(
            postsRepository: _postsRepository,
          );
        },
        act: (cubit) {
          when(() => _postsRepository.getCommentsById(postId: 1)).thenAnswer(
            (invocation) async => Result.success(comments),
          );
          cubit.getCommentsByPost(postId: 1);
        },
        seed: () => PostState.success(posts: posts, favoritePosts: const []),
        expect: () => <PostState>[
          PostState.pending(posts: posts, favoritePosts: const []),
          PostState.success(
            posts: posts,
            favoritePosts: const [],
            commentsByPost: comments,
          ),
        ],
      );
    });
  });
}
