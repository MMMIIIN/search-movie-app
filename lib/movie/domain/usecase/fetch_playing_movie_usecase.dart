import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/core/network/typedef.dart';
import 'package:riverpod_example/movie/data/repositories/movie_repository_impl.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';
import 'package:riverpod_example/movie/domain/repository/movie_repository.dart';

part 'fetch_playing_movie_usecase.g.dart';

class FetchPlayingMovieUseCase {
  final MovieRepository movieRepository;

  FetchPlayingMovieUseCase(this.movieRepository);

  ResultFuture<MovieResultEntity> call() async {
    return movieRepository.fetchMovie();
  }
}

@riverpod
FetchPlayingMovieUseCase fetchPlayingMovieUseCase(Ref ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchPlayingMovieUseCase(repository);
}
