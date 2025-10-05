import 'package:riverpod_example/core/network/typedef.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';

abstract class MovieRepository {
  ResultFuture<MovieResultEntity> fetchMovie();
}
