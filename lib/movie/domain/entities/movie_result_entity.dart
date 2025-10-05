import 'package:riverpod_example/movie/domain/entities/movie_date_entity.dart';
import 'package:riverpod_example/movie/domain/entities/movie_entity.dart';

class MovieResultEntity {
  final MovieDateEntity dates;
  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MovieResultEntity({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResultEntity.empty() {
    return MovieResultEntity(
      dates: MovieDateEntity.empty(),
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0,
    );
  }
}
