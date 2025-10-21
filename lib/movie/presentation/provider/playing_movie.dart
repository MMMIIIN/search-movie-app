import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';
import 'package:riverpod_example/movie/domain/usecase/fetch_playing_movie_usecase.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';
part 'playing_movie.g.dart';

@riverpod
class PlayingMovie extends _$PlayingMovie {
  @override
  FutureOr<MovieResultEntity> build(MovieSortType sortType) async {
    final fetchUseCase = ref.watch(fetchPlayingMovieUseCaseProvider);
    final result = await fetchUseCase();

    return result.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (movieResult) {
        final sortUseCase = ref.watch(sortMoviesUseCaseProvider);
        final sortedMovies = sortUseCase(movieResult.results, sortType);

        return MovieResultEntity(
          dates: movieResult.dates,
          page: movieResult.page,
          results: sortedMovies,
          totalPages: movieResult.totalPages,
          totalResults: movieResult.totalResults,
        );
      },
    );
  }
}
