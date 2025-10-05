import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/movie/domain/entities/movie_result_entity.dart';
import 'package:riverpod_example/movie/domain/usecase/fetch_playing_movie_usecase.dart';
part 'playing_movie.g.dart';

@riverpod
class PlayingMovie extends _$PlayingMovie {
  @override
  /// 캐싱 처리를 위해 FutureOr로 처리함.
  FutureOr<MovieResultEntity> build() async {
    final useCase = ref.watch(fetchPlayingMovieUseCaseProvider);
    final result = await useCase();

    return result.fold((failure) {
      throw Exception(failure.message);
    }, (data) => data);
  }
}
