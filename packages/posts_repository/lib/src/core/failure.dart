import 'package:flutter/material.dart';

/// Represents a failure in the repository layer.
abstract class Failure implements Exception {}

/// {@template zemoga_posts_failure}
/// Returned when an exception is caught in the PostsRepository.
/// {@endtemplate}
@immutable
class ZemogaPostsFailure extends Failure {
  /// {@macro zemoga_posts_failure}
  ZemogaPostsFailure([this.message]);

  /// The message associated with the failure.
  final String? message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZemogaPostsFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'ZemogaPostsFailure(message: $message)';
}
