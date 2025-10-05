import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/core/network/failure.dart';
import 'package:riverpod_example/movie/domain/usecase/fetch_playing_movie_usecase.dart';

import '../../../helpers/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late FetchPlayingMovieUseCase useCase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = FetchPlayingMovieUseCase(mockRepository);
  });

  group('FetchPlayingMovieUseCase', () {
    test('should get movie result from repository', () async {
      // arrange
      when(
        mockRepository.fetchMovie(),
      ).thenAnswer((_) async => Right(testMovieResultEntity));

      // act
      final result = await useCase();

      // assert
      expect(result, Right(testMovieResultEntity));
      verify(mockRepository.fetchMovie());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const testFailure = APIFailure(message: 'Server error', statusCode: 500);
      when(
        mockRepository.fetchMovie(),
      ).thenAnswer((_) async => const Left(testFailure));

      // act
      final result = await useCase();

      // assert
      expect(result, const Left(testFailure));
      verify(mockRepository.fetchMovie());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
