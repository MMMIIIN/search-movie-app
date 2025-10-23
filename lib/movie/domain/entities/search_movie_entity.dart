import 'package:riverpod_example/movie/domain/entities/movie_entity.dart';
import 'package:riverpod_example/movie/domain/entities/movie_list_entity.dart';

class SearchMovieEntity implements MovieListEntity {
  @override
  final int page;

  @override
  final List<MovieEntity> results;

  @override
  final int totalPages;

  @override
  final int totalResults;

  const SearchMovieEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
