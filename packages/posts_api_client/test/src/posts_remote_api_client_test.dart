// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_api_client/posts_api_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('PostsRemoteApiClient', () {
    late PostsRemoteApiClient _api;
    late Dio _dio;

    final mockPosts = List.generate(
      2,
      (index) => Post(
        userId: index,
        id: index,
        title: 'Test Title',
        body: 'Test description of the post',
      ),
    );
    final mockComments = List.generate(
      2,
      (index) => PostComment(
        postId: index,
        id: index,
        email: 'Test email',
        name: 'Test name',
        body: 'Test description of the comment',
      ),
    );

    setUp(() {
      _dio = MockDio();
      _api = PostsRemoteApiClient(dio: _dio);
    });
    test('can be instantiated', () {
      expect(_api, isNotNull);
    });

    group('.getAllPosts', () {
      late String _url;
      late RequestOptions _requestOptions;

      setUp(() {
        _url = '/posts';
        _requestOptions = RequestOptions(path: _url);
      });

      test('fetches all the posts', () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 200,
            data: mockPosts.map((e) => e.toJson()).toList(),
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getAllPosts(),
          completion(equals(mockPosts)),
        );

        verify(() => _dio.get<List<Map<String, dynamic>>>(_url)).called(1);
      });

      test('throws InvalidRequestOptions when status code is not 200', () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 400,
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getAllPosts(),
          throwsA(isA<InvalidRequestException>()),
        );

        verify(() => _dio.get<List<Map<String, dynamic>>>(_url)).called(1);
      });
      test('throws JsonDeserializationException when decoding response fails',
          () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 200,
            data: [{}],
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getAllPosts(),
          throwsA(isA<JsonDeserializationException>()),
        );

        verify(() => _dio.get<List<Map<String, dynamic>>>(_url)).called(1);
      });
    });

    group('.getCommentsByPost', () {
      late String _url;
      late RequestOptions _requestOptions;
      late int _postId;

      setUp(() {
        _postId = 1;
        _url = '/posts/$_postId/comments';
        _requestOptions = RequestOptions(path: _url);
      });

      test('fetches all comments of a particular post', () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 200,
            data: mockComments.map((e) => e.toJson()).toList(),
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getCommentsByPost(postId: _postId.toString()),
          completion(equals(mockComments)),
        );
      });

      test('throws InvalidRequestOptions when status code is not 200', () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 400,
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getCommentsByPost(postId: _postId.toString()),
          throwsA(isA<InvalidRequestException>()),
        );

        verify(() => _dio.get<List<Map<String, dynamic>>>(_url)).called(1);
      });

      test('throws JsonDeserializationException when decoding response fails',
          () {
        when(() => _dio.get<List<Map<String, dynamic>>>(_url)).thenAnswer(
          (_) async => Response<List<Map<String, dynamic>>>(
            statusCode: 200,
            data: [{}],
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.getCommentsByPost(postId: _postId.toString()),
          throwsA(isA<JsonDeserializationException>()),
        );

        verify(() => _dio.get<List<Map<String, dynamic>>>(_url)).called(1);
      });
    });

    group('.deletePost', () {
      late String _url;
      late RequestOptions _requestOptions;
      late int _postId;

      setUp(() {
        _postId = 1;
        _url = '/posts/$_postId';
        _requestOptions = RequestOptions(path: _url);
      });

      test('makes correct delete request', () {
        when(() => _dio.delete<dynamic>(_url)).thenAnswer(
          (_) async => Response<Map<String, dynamic>>(
            statusCode: 200,
            data: {},
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.deletePost(postId: _postId.toString()),
          isNotNull,
        );
      });

      test('throws InvalidRequestOptions when status code is not 200', () {
        when(() => _dio.delete<dynamic>(_url)).thenAnswer(
          (_) async => Response<Map<String, dynamic>>(
            statusCode: 400,
            requestOptions: _requestOptions,
          ),
        );

        expect(
          _api.deletePost(postId: _postId.toString()),
          throwsA(isA<InvalidRequestException>()),
        );

        verify(() => _dio.delete<dynamic>(_url)).called(1);
      });
    });
  });
}
