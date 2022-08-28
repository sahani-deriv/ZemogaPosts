import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api_client/posts_api_client.dart';
import 'package:posts_repository/posts_repository.dart';

part 'post_state.dart';

/// {@template post_cubit}
/// Bloc which manages the current [PostState]. Externally, should only
/// depend on a [PostsRepository] and nothing else.
/// {@endtemplate}
class PostCubit extends Cubit<PostState> {
  /// {@macro post_cubit}
  PostCubit({
    required PostsRepository postsRepository,
  })  : _postsRepository = postsRepository,
        super(
          PostState.pending(
            posts: const [],
            favoritePosts: const [],
          ),
        );

  final PostsRepository _postsRepository;

  /// Interacts with [PostsRepository] to fetch all posts.
  Future<void> getAllPosts() async {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    final result = await _postsRepository.getAllPosts();
    result.when(
      success: (val) {
        emit(
          PostState.success(posts: val, favoritePosts: state.favoritePosts),
        );
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message:
                failure.message ?? 'Something went wrong while fetching posts',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }

  /// Interacts with [PostsRepository] to fetch all favorite posts.
  void getAllFavoritePosts() {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    _postsRepository.getAllFavoritePosts().when(
      success: (val) {
        emit(PostState.success(posts: state.posts, favoritePosts: val));
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message: failure.message ??
                'Something went wrong while fetching favorites',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }

  /// Interacts with [PostsRepository] to add a post to favorites.
  void addPostToFavorites({required Post post}) {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    if (state.favoritePosts.contains(post)) {
      removePostFromFavorites(post: post);
    } else {
      _postsRepository.addPostToFavorites(post: post);
      emit(
        PostState.success(
          posts: [...state.posts]..remove(post),
          favoritePosts: [...state.favoritePosts, post],
          message: 'Added to favorites!',
        ),
      );
    }
  }

  /// Interacts with [PostsRepository] to remove a post to favorites.
  void removePostFromFavorites({required Post post}) {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );

    _postsRepository.removeFromFavorites(post: post).when(
      success: (_) {
        emit(
          PostState.success(
            posts: [post, ...state.posts],
            favoritePosts: [...state.favoritePosts]..remove(post),
            message: 'Removed from favorites!',
          ),
        );
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message: failure.message ?? 'Something went wrong.',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }

  /// Interacts with [PostsRepository] to remove a all posts from cache.
  void deleteAllPosts() {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    _postsRepository.deleteAllPosts();
    emit(
      PostState.success(
        posts: const [],
        favoritePosts: state.favoritePosts,
        message: 'Successfully deleted all posts!',
      ),
    );
  }

  /// Interacts with [PostsRepository] to remove a post from cache
  ///  and refetch posts.
  Future<void> refetchPosts() async {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    final result = await _postsRepository.refetchPosts();
    result.when(
      success: (val) {
        emit(
          PostState.success(
            posts: val,
            favoritePosts: state.favoritePosts,
            message: 'Successfully re-fetched posts!',
          ),
        );
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message: failure.message ??
                'Something went wrong while re-fetching posts',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }

  /// Interacts with [PostsRepository] to delete a post from cache.
  void deletePost({required Post post}) {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );
    _postsRepository.deletePost(post: post).when(
      success: (_) {
        if (state.posts.contains(post)) {
          emit(
            PostState.success(
              posts: [...state.posts]..remove(post),
              favoritePosts: state.favoritePosts,
              message: 'Successfully deleted post!',
            ),
          );
        } else {
          emit(
            PostState.success(
              posts: state.posts,
              favoritePosts: [...state.favoritePosts]..remove(post),
              message: 'Successfully deleted post!',
            ),
          );
        }
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message:
                failure.message ?? 'Something went wrong while deleting post',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }

  /// Interacts with [PostsRepository] to get comments by post.
  Future<void> getCommentsByPost({required int postId}) async {
    emit(
      PostState.pending(
        posts: state.posts,
        favoritePosts: state.favoritePosts,
      ),
    );

    final result = await _postsRepository.getCommentsById(postId: postId);
    result.when(
      success: (comments) {
        emit(
          PostState.success(
            posts: state.posts,
            favoritePosts: state.favoritePosts,
            commentsByPost: comments,
          ),
        );
      },
      failure: (failure) {
        emit(
          PostState.failure(
            message: failure.message ??
                'Something went wrong while fetching comments',
            posts: state.posts,
            favoritePosts: state.favoritePosts,
          ),
        );
      },
    );
  }
}
