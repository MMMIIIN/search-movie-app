import 'package:riverpod_example/movie/domain/entities/movie_entity.dart';

/// 영화 목록의 공통 인터페이스
abstract class MovieListEntity {
  int get page;
  List<MovieEntity> get results;
  int get totalPages;
  int get totalResults;
}
