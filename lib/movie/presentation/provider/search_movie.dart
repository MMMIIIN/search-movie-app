import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/movie/domain/entities/movie_list_entity.dart';
import 'package:riverpod_example/movie/domain/entities/search_movie_entity.dart';
import 'package:riverpod_example/movie/domain/usecase/fetch_search_movie_usecase.dart';
import 'package:riverpod_example/movie/domain/usecase/sort_movies_usecase.dart';

part 'search_movie.g.dart';

@riverpod
class SearchMovie extends _$SearchMovie {
  @override
  FutureOr<MovieListEntity> build(String query, MovieSortType sortType) async {
    return search(query, sortType);
  }

  FutureOr<MovieListEntity> search(String query, MovieSortType sortType) async {
    final fetchUseCase = ref.watch(fetchSearchMovieUseCaseProvider);
    final result = await fetchUseCase(query);

    return result.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (movieResult) {
        final sortUseCase = ref.watch(sortMoviesUseCaseProvider);
        final sortedMovies = sortUseCase(movieResult.results, sortType);

        return SearchMovieEntity(
          page: movieResult.page,
          results: sortedMovies,
          totalPages: movieResult.totalPages,
          totalResults: movieResult.totalResults,
        );
      },
    );
  }
}
