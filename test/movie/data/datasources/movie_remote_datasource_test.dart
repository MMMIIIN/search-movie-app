import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/core/network/exceptions.dart';
import 'package:riverpod_example/movie/data/datasources/movie_remote_datasource.dart';
import 'package:riverpod_example/movie/data/models/movie_result_model.dart';

import '../../../helpers/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = MovieRemoteDataSourceImpl(mockDio);
  });

  group('fetchPlayingMovies', () {
    test('should return MovieResultModel when response is successful', () async {
      // arrange
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => Response(
            data: testMovieResultJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // act
      final result = await dataSource.fetchPlayingMovies();

      // assert
      expect(result, isA<MovieResultModel>());
      expect(result.page, 1);
      expect(result.results.length, 1);
      expect(result.results.first.title, 'Test Movie');
    });

    test('should throw APIException when Dio throws DioException', () async {
      // arrange
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
        message: 'Not found',
      ));

      // act & assert
      expect(
        () => dataSource.fetchPlayingMovies(),
        throwsA(isA<APIException>().having(
          (e) => e.statusCode,
          'statusCode',
          404,
        )),
      );
    });

    test('should throw APIException with 500 when generic exception occurs',
        () async {
      // arrange
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenThrow(Exception('Unknown error'));

      // act & assert
      expect(
        () => dataSource.fetchPlayingMovies(),
        throwsA(isA<APIException>().having(
          (e) => e.statusCode,
          'statusCode',
          500,
        )),
      );
    });
  });
}
