import 'package:flutter_test/flutter_test.dart';
import 'package:posts_repository/src/core/core.dart';

void main() {
  group('PostsFailure', () {
    test('instantiates', () {
      expect(
        PostsFailure('failure-msg'),
        PostsFailure('failure-msg'),
      );
    });

    test('toString', () {
      expect(
        PostsFailure('failure-msg').toString(),
        'PostsFailure(message: failure-msg)',
      );
    });

    test('equals', () {
      final failure1 = PostsFailure('failure-msg');
      final failure2 = PostsFailure('failure-msg');
      expect(failure1, failure2);
      expect(failure1.hashCode, failure2.hashCode);
    });
  });
}
