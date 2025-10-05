import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/core/network/exceptions.dart';
import 'package:riverpod_example/core/network/failure.dart';
import 'package:riverpod_example/movie/data/models/movie_result_model.dart';
import 'package:riverpod_example/movie/data/repositories/movie_repository_impl.dart';

import '../../../helpers/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(mockRemoteDataSource);
  });

  group('fetchMovie', () {
    final testMovieResultModel = MovieResultModel(
      dates: testMovieDateEntity,
      page: 1,
      results: [testMovieEntity],
      totalPages: 10,
      totalResults: 100,
    );

    test(
      'should return movie result when remote data source call is successful',
      () async {
        // arrange
        when(
          mockRemoteDataSource.fetchPlayingMovies(),
        ).thenAnswer((_) async => testMovieResultModel);

        // act
        final result = await repository.fetchMovie();

        // assert
        expect(result, Right(testMovieResultModel));
        verify(mockRemoteDataSource.fetchPlayingMovies());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return APIFailure when remote data source throws APIException',
      () async {
        // arrange
        when(mockRemoteDataSource.fetchPlayingMovies()).thenThrow(
          const APIException(message: 'Server error', statusCode: 500),
        );

        // act
        final result = await repository.fetchMovie();

        // assert
        expect(
          result,
          const Left(APIFailure(message: 'Server error', statusCode: 500)),
        );
        verify(mockRemoteDataSource.fetchPlayingMovies());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return APIFailure when remote data source throws generic exception',
      () async {
        // arrange
        when(
          mockRemoteDataSource.fetchPlayingMovies(),
        ).thenThrow(Exception('Unknown error'));

        // act
        final result = await repository.fetchMovie();

        // assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<APIFailure>());
          expect(failure.statusCode, 500);
          expect(failure.message, contains('Exception: Unknown error'));
        }, (_) => fail('Should return Left'));
        verify(mockRemoteDataSource.fetchPlayingMovies());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );
  });
}
