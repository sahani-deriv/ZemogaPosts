part of 'post_cubit.dart';

/// {@template price_tracker_state}
/// Describes the different states of the [PostCubit].
/// Instances should be created using the factory methods to
/// make the possible states explicit and typed.
/// {@endtemplate}
@immutable
class PostState {
  const PostState._({
    required this.status,
    required this.posts,
    required this.favoritePosts,
    this.message,
    this.commentsByPost,
  });

  /// Returns a [PostState] with the [status] set to
  /// [PostStatus.pending]. Denotes the pending state.
  factory PostState.pending({
    String? message,
    required List<Post> posts,
    required List<Post> favoritePosts,
  }) =>
      PostState._(
        status: PostStatus.pending,
        message: message,
        posts: posts,
        favoritePosts: favoritePosts,
      );

  /// Returns a [PostState] with the [status] set to
  /// [PostStatus.success] and the posts.
  /// The [posts] should not be empty when the status is success.
  factory PostState.success({
    String? message,
    required List<Post> posts,
    required List<Post> favoritePosts,
    List<Comment>? commentsByPost,
  }) {
    return PostState._(
      status: PostStatus.success,
      message: message,
      posts: posts,
      favoritePosts: favoritePosts,
      commentsByPost: commentsByPost,
    );
  }

  /// Returns a [PostState] with the [status] set to
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
  final PostStatus status;

  /// Represents the list of posts.
  final List<Post> posts;

  /// Represents the list of favorite posts.
  final List<Post> favoritePosts;

  /// Represents the message to notify anything.
  final String? message;

  /// Represents comments of a post
  final List<Comment>? commentsByPost;

  /// The equality operator.
  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;
    return other is PostState &&
        runtimeType == other.runtimeType &&
        status == other.status &&
        listEquals(posts, other.posts) &&
        listEquals(favoritePosts, other.favoritePosts) &&
        message == other.message;
  }

  /// The hashCode method.
  @override
  int get hashCode =>
      status.hashCode ^
      posts.hashCode ^
      favoritePosts.hashCode ^
      message.hashCode;

  /// The toString method.
  @override
  String toString() {
    return '''
PostState{status: $status, posts: $posts, 
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
