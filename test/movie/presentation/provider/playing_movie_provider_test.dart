import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/movie/data/repositories/movie_repository_impl.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';
import 'package:riverpod_example/movie/presentation/provider/playing_movie.dart';

import '../../../helpers/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
  });

  group('PlayingMovieProvider', () {
    test('should emit movie result when usecase returns success', () async {
      // arrange
      when(
        mockRepository.fetchMovie(),
      ).thenAnswer((_) async => Right(testMovieResultEntity));

      final container = ProviderContainer(
        overrides: [movieRepositoryProvider.overrideWithValue(mockRepository)],
      );
      addTearDown(container.dispose);

      // act
      final result = await container
          .read(playingMovieProvider(MovieSortType.popularityHigh).future);

      // assert
      expect(result.results.length, 1);
      expect(result.results.first.title, 'Test Movie');
      verify(mockRepository.fetchMovie());
    });

    test('should handle multiple reads with caching', () async {
      // arrange
      when(
        mockRepository.fetchMovie(),
      ).thenAnswer((_) async => Right(testMovieResultEntity));

      final container = ProviderContainer(
        overrides: [movieRepositoryProvider.overrideWithValue(mockRepository)],
      );
      addTearDown(container.dispose);

      // act - read twice
      final result1 = await container
          .read(playingMovieProvider(MovieSortType.popularityHigh).future);
      final result2 = await container
          .read(playingMovieProvider(MovieSortType.popularityHigh).future);

      // assert - should call repository only once due to caching
      expect(result1, result2);
      verify(mockRepository.fetchMovie()).called(1);
    });
  });
}
