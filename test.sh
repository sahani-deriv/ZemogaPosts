#!/usr/bin/zsh

echo "Running tests in root dir..."
flutter test --coverage --test-randomize-ordering-seed random
genhtml coverage/lcov.info -o coverage/

echo "\nRunning tests in posts_repository..."
cd packages/posts_repository
flutter test --coverage --test-randomize-ordering-seed random
genhtml coverage/lcov.info -o coverage/


echo "\nRunning tests in posts_api_client..."
cd packages/posts_api_client
flutter test --coverage --test-randomize-ordering-seed random
genhtml coverage/lcov.info -o coverage/


