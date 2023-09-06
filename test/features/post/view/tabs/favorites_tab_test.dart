import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/features/posts/cubit/post_cubit.dart';

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
  group('Favorite Tab', () {
    late MockPostCubit _postCubit;

    setUp(() {
      _postCubit = MockPostCubit();
      when(() => _postCubit.getAllPosts()).thenAnswer(
        (_) async => PostState.success(posts: posts, favoritePosts: posts),
      );
      when(() => _postCubit.getAllFavoritePosts()).thenAnswer(
        (_) => PostState.success(posts: posts, favoritePosts: posts),
      );
    });

    // testWidgets('renders list view on success state', (tester) async {
    //   when(() => _postCubit.state).thenAnswer(
    //     (_) => PostState.success(posts: posts, favoritePosts: posts),
    //   );
    //   when(() => _postCubit.stream).thenAnswer(
    //     (_) => Stream.fromIterable(
    //       [PostState.success(posts: posts, favoritePosts: posts)],
    //     ),
    //   );

    //   await tester.pumpAppWithDependencies(
    //     const FavoritesTab(),
    //     cubit: _postCubit,
    //   );

    //   expect(find.byType(ListView), findsOneWidget);
    // });
  });
}
