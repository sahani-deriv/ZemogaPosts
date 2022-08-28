import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';
import 'package:zemoga_posts/features/posts/view/pages/posts_list_page.dart';
import 'package:zemoga_posts/features/posts/view/widgets/tab_view.dart';

import '../../../helpers/helpers.dart';

class MockPostCubit extends Mock implements PostCubit {}

class MockPostRepository extends Mock implements PostsRepository {}

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
  group('PostsListPage', () {
    late MockPostRepository _postRepository;
    late MockPostCubit _postCubit;

    setUp(() {
      _postRepository = MockPostRepository();
      _postCubit = MockPostCubit();
      when(() => _postRepository.getAllPosts())
          .thenAnswer((_) async => const Result.success([]));
      when(() => _postRepository.getAllFavoritePosts())
          .thenAnswer((_) => const Result.success([]));
      when(() => _postCubit.getAllPosts()).thenAnswer(
        (_) async => PostState.success(posts: posts, favoritePosts: posts),
      );
      when(() => _postCubit.getAllFavoritePosts()).thenAnswer(
        (_) => PostState.success(posts: posts, favoritePosts: posts),
      );
    });
    testWidgets('renders app tab view', (tester) async {
      await tester.pumpAppWithDependencies(
        const PostsListPage(),
        cubit: _postCubit,
        repository: _postRepository,
      );

      expect(find.byType(AppTabView), findsOneWidget);
    });

    testWidgets('shows snackbar on receiving message from state',
        (tester) async {
      when(() => _postRepository.getAllPosts())
          .thenAnswer((_) async => const Result.success([]));
      when(() => _postCubit.getAllPosts()).thenAnswer(
        (_) async => emits(
          PostState.success(
            posts: posts,
            favoritePosts: posts,
            message: 'Message',
          ),
        ),
      );

      when(() => _postCubit.state).thenReturn(
        PostState.success(
          posts: posts,
          favoritePosts: posts,
          message: 'Message',
        ),
      );

      await tester.pumpAppWithDependencies(
        const PostsListView(),
        cubit: _postCubit,
        repository: _postRepository,
      );

      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
