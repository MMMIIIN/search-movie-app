// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_movie.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayingMovie)
const playingMovieProvider = PlayingMovieProvider._();

final class PlayingMovieProvider
    extends $AsyncNotifierProvider<PlayingMovie, MovieResultEntity> {
  const PlayingMovieProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playingMovieProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playingMovieHash();

  @$internal
  @override
  PlayingMovie create() => PlayingMovie();
}

String _$playingMovieHash() => r'd8f520056f10d5c4590df1aa7242b70d9585ff75';

abstract class _$PlayingMovie extends $AsyncNotifier<MovieResultEntity> {
  FutureOr<MovieResultEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<MovieResultEntity>, MovieResultEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieResultEntity>, MovieResultEntity>,
              AsyncValue<MovieResultEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
