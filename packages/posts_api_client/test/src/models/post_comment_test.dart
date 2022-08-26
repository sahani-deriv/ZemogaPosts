import 'package:posts_api_client/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Post', () {
    test('supports value comparisons', () {
      expect(
        PostData(
          userId: 1,
          id: 1,
          title: 'Test Title',
          body: 'Test description of the post',
        ),
        PostData(
          userId: 1,
          id: 1,
          title: 'Test Title',
          body: 'Test description of the post',
        ),
      );
    });

    test('has concise toString', () {
      expect(
        PostData(
          userId: 1,
          id: 1,
          title: 'Test Title',
          body: 'Test description of the post',
        ).toString(),
        equals(
          '''
Post(userId: 1, id: 1, title: Test Title, body: Test description of the post)''',
        ),
      );
    });
  });
}
