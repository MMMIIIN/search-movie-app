import 'package:riverpod_example/core/network/typedef.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';
import 'package:riverpod_example/movie/domain/entities/search_movie_entity.dart';

abstract class MovieRepository {
  ResultFuture<MovieResultEntity> fetchMovie();
  ResultFuture<SearchMovieEntity> searchMovie(String query);
}
