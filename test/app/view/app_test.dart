// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/app/app.dart';

import '../../helpers/helpers.dart';

class MockPostRepository extends Mock implements PostsRepository {}

void main() {
  group('App', () {
    late PostsRepository _postRepository;

    setUp(() {
      _postRepository = MockPostRepository();
      when(() => _postRepository.getAllPosts())
          .thenAnswer((_) async => const Result.success([]));
      when(() => _postRepository.getAllFavoritePosts())
          .thenAnswer((_) => const Result.success([]));
    });
    testWidgets('renders AppView', (tester) async {
      await tester.pumpAppWithDependencies(
        App(
          postsRepository: _postRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
