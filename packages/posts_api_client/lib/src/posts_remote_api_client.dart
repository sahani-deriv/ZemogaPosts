import 'package:dio/dio.dart';
import 'package:posts_api_client/src/exceptions/exceptions.dart';
import 'package:posts_api_client/src/models/models.dart';

/// {@template posts_remote_api_client}
/// A Dart API Client for the posts REST API.
/// {@endtemplate}
class PostsRemoteApiClient {
  /// {@macro posts_remote_api_client}
  PostsRemoteApiClient({required Dio dio})
      : _dio = dio
          ..options = BaseOptions(
            baseUrl: _kBaseUrl,
            contentType: Headers.jsonContentType,
          );

  static const _kBaseUrl = 'https://jsonplaceholder.typicode.com';
  final Dio _dio;

  /// Fetches all the posts.
  ///
  /// REST call: `GET /posts`
  Future<List<Post>> getAllPosts() async {
    final response = await _makeRequest<List<Map<String, dynamic>>>(
      httpMethod: _HttpMethod.get,
      endpoint: '/posts',
    );
    try {
      return response.map(Post.fromJson).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
  }

  /// Fetches the comments of a post of given id.
  ///
  /// REST call: `GET /posts/:id/comments`
  Future<List<Comment>> getCommentsByPost({required String postId}) async {
    final response = await _makeRequest<List<Map<String, dynamic>>>(
      httpMethod: _HttpMethod.get,
      endpoint: '/posts/$postId/comments',
    );
    try {
      return response.map(Comment.fromJson).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
  }

  /// Deletes a post of given id.
  ///
  /// REST call: `DELETE /posts/:id`
  Future<void> deletePost({required String postId}) async {
    await _makeRequest<dynamic>(
      httpMethod: _HttpMethod.delete,
      endpoint: '/posts/$postId',
    );
  }

  /// Make a get or post request to the given endpoint.
  Future<T> _makeRequest<T>({
    required _HttpMethod httpMethod,
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    Response<dynamic> response;
    const validStatusCode = 200;

    try {
      switch (httpMethod) {
        case _HttpMethod.get:
          response = await _dio.get<dynamic>(endpoint);
          break;
        case _HttpMethod.post:
          response = await _dio.post<T>(endpoint, data: data);
          break;
        case _HttpMethod.delete:
          response = await _dio.delete<T>(endpoint);
          break;
      }
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      final msg = e.message;
      if (statusCode == 404) throw InvalidRequestException(statusCode, msg);
      throw const NetworkException();
    }

    if (response.statusCode != validStatusCode) {
      throw InvalidRequestException(response.statusCode);
    }

    try {
      if (response.data is List) {
        return (response.data as List).cast<Map<String, dynamic>>() as T;
      } else {
        return response.data as T;
      }
    } catch (_) {
      throw const BadResponseException();
    }
  }
}

// A Http method representation.
enum _HttpMethod {
  get,
  post,
  delete,
}
