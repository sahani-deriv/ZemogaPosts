// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:zemoga_posts/app/app.dart';
import 'package:zemoga_posts/bootstrap.dart';

void main() {
  final _postsRemoteApiClient = PostsRemoteApiClient();
  final _postsLocalApiClient = PostsLocalApiClient();
  final _postsRepository = PostRepositoryImpl(
    postsRemoteApiClient: _postsRemoteApiClient,
    localApiClient: _postsLocalApiClient,
  );
  bootstrap(
    () => App(
      postsRepository: _postsRepository,
    ),
  );
}
