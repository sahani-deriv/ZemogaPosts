import 'package:posts_api_client/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('PostComment', () {
    test('supports value comparisons', () {
      expect(
        PostComment(
          postId: 1,
          id: 1,
          email: 'Test email',
          name: 'Test name',
          body: 'Test description of the comment',
        ),
        PostComment(
          postId: 1,
          id: 1,
          email: 'Test email',
          name: 'Test name',
          body: 'Test description of the comment',
        ),
      );
    });

    test('has concise toString', () {
      expect(
        PostComment(
          postId: 1,
          id: 1,
          email: 'Test email',
          name: 'Test name',
          body: 'Test description of the comment',
        ).toString(),
        equals(
          '''
PostComment(postId: 1, id: 1, name: Test name, email: Test email, body: Test description of the comment)''',
        ),
      );
    });
  });
}
