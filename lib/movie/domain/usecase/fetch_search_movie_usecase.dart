import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/core/network/typedef.dart';
import 'package:riverpod_example/movie/data/repositories/movie_repository_impl.dart';
import 'package:riverpod_example/movie/domain/entities/search_movie_entity.dart';
import 'package:riverpod_example/movie/domain/repository/movie_repository.dart';

part 'fetch_search_movie_usecase.g.dart';

class FetchSearchMovieUseCase {
  final MovieRepository movieRepository;

  FetchSearchMovieUseCase(this.movieRepository);

  ResultFuture<SearchMovieEntity> call(String query) async {
    return movieRepository.searchMovie(query);
  }
}

@riverpod
FetchSearchMovieUseCase fetchSearchMovieUseCase(Ref ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchSearchMovieUseCase(repository);
}
