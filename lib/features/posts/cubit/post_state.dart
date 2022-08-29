part of 'post_cubit.dart';

/// {@template post_state}
/// Describes the different states of the [PostCubit].
/// Instances should be created using the factory methods to
/// make the possible states explicit and typed.
/// {@endtemplate}
@immutable
class PostState {
  /// {@macro post_state}
  const PostState._({
    required PostStatus status,
    required this.posts,
    required this.favoritePosts,
    this.message,
    this.commentsByPost = const [],
  }) : _status = status;

  /// Returns a [PostState] with the [_status] set to
  /// [PostStatus.pending]. Denotes the pending state.
  factory PostState.pending({
    String? message,
    required List<Post> posts,
    required List<Post> favoritePosts,
    List<Comment> comments = const [],
  }) =>
      PostState._(
        status: PostStatus.pending,
        message: message,
        posts: posts,
        favoritePosts: favoritePosts,
        commentsByPost: comments,
      );

  /// Returns a [PostState] with the [_status] set to
  /// [PostStatus.success] and the posts.
  /// The [posts] should not be empty when the status is success.
  factory PostState.success({
    String? message,
    required List<Post> posts,
    required List<Post> favoritePosts,
    List<Comment> commentsByPost = const [],
  }) {
    return PostState._(
      status: PostStatus.success,
      message: message,
      posts: posts,
      favoritePosts: favoritePosts,
      commentsByPost: commentsByPost,
    );
  }

  /// Returns a [PostState] with the [_status] set to
  /// [PostStatus.failure] and the error message.
  factory PostState.failure({
    required String message,
    required List<Post> posts,
    required List<Post> favoritePosts,
  }) =>
      PostState._(
        status: PostStatus.failure,
        message: message,
        posts: posts,
        favoritePosts: favoritePosts,
      );

  /// Represents the current status of a request/process.
  final PostStatus _status;

  /// Represents the list of posts.
  final List<Post> posts;

  /// Represents the list of favorite posts.
  final List<Post> favoritePosts;

  /// Represents the message to notify anything.
  /// Should be null when no message needs to be displayed.
  final String? message;

  /// Represents comments of a post
  final List<Comment> commentsByPost;

  /// Emulating pattern matching for making exclusive states clear.
  /// Return a null value as the fallback.
  T when<T>({
    required T Function(
      List<Post> posts,
      List<Post> favorites,
    )
        pending,
    required T Function(List<Post> posts, List<Post> favorites) success,
    required T Function(
      String message,
      List<Post> posts,
      List<Post> favorites,
    )
        failure,
  }) {
    switch (_status) {
      case PostStatus.pending:
        return pending(posts, favoritePosts);
      case PostStatus.success:
        return success(posts, favoritePosts);
      case PostStatus.failure:
        return failure(
          message ?? 'An unknown error occurred.',
          posts,
          favoritePosts,
        );
    }
  }

  /// Similar to the when method with a fallback callback.
  T maybeWhen<T>({
    T Function(List<Post> posts, List<Post> favorites)? pending,
    T Function(List<Post> posts, List<Post> favorites, List<Comment>? comments)?
        success,
    T Function(String)? failure,
    required T Function() orElse,
  }) {
    switch (_status) {
      case PostStatus.pending:
        return pending?.call(posts, favoritePosts) ?? orElse();
      case PostStatus.success:
        return success?.call(posts, favoritePosts, commentsByPost) ?? orElse();
      case PostStatus.failure:
        return failure?.call(message ?? 'An unknown error occurred.') ??
            orElse();
    }
  }

  /// The equality operator.
  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;
    return other is PostState &&
        runtimeType == other.runtimeType &&
        _status == other._status &&
        listEquals(posts, other.posts) &&
        listEquals(favoritePosts, other.favoritePosts) &&
        message == other.message;
  }

  /// The hashCode method.
  @override
  int get hashCode =>
      _status.hashCode ^
      posts.hashCode ^
      favoritePosts.hashCode ^
      message.hashCode;

  /// The toString method.
  @override
  String toString() {
    return '''
PostState{status: $_status, posts: $posts, 
    favoritePosts: $favoritePosts, message: $message}''';
  }
}

/// Cubit Status that represents the state of active symbols and their prices.
enum PostStatus {
  /// Represents the failure status.
  failure,

  /// Represents the success status.
  success,

  /// Represents the loading status.
  pending
}
