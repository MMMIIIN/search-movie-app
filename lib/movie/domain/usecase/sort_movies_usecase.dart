import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/movie/domain/entities/movie_entity.dart';

part 'sort_movies_usecase.g.dart';

enum MovieSortType {
  voteAverageHigh,
  voteAverageLow,
  popularityHigh,
  popularityLow,
  releaseDateNew,
  releaseDateOld,
}

class SortMoviesUseCase {
  List<MovieEntity> call(List<MovieEntity> movies, MovieSortType sortType) {
    final movieList = List<MovieEntity>.from(movies);

    switch (sortType) {
      case MovieSortType.voteAverageHigh:
        movieList.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
      case MovieSortType.voteAverageLow:
        movieList.sort((a, b) => a.voteAverage.compareTo(b.voteAverage));
      case MovieSortType.popularityHigh:
        movieList.sort((a, b) => b.popularity.compareTo(a.popularity));
      case MovieSortType.popularityLow:
        movieList.sort((a, b) => a.popularity.compareTo(b.popularity));
      case MovieSortType.releaseDateNew:
        movieList.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
      case MovieSortType.releaseDateOld:
        movieList.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    }

    return movieList;
  }
}

@riverpod
SortMoviesUseCase sortMoviesUseCase(Ref ref) {
  return SortMoviesUseCase();
}
