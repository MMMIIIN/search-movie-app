// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_movie.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayingMovie)
const playingMovieProvider = PlayingMovieFamily._();

final class PlayingMovieProvider
    extends $AsyncNotifierProvider<PlayingMovie, MovieResultEntity> {
  const PlayingMovieProvider._({
    required PlayingMovieFamily super.from,
    required MovieSortType super.argument,
  }) : super(
         retry: null,
         name: r'playingMovieProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playingMovieHash();

  @override
  String toString() {
    return r'playingMovieProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlayingMovie create() => PlayingMovie();

  @override
  bool operator ==(Object other) {
    return other is PlayingMovieProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playingMovieHash() => r'3530f895762c3a7a593454551cb2fc695a3a3170';

final class PlayingMovieFamily extends $Family
    with
        $ClassFamilyOverride<
          PlayingMovie,
          AsyncValue<MovieResultEntity>,
          MovieResultEntity,
          FutureOr<MovieResultEntity>,
          MovieSortType
        > {
  const PlayingMovieFamily._()
    : super(
        retry: null,
        name: r'playingMovieProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlayingMovieProvider call(MovieSortType sortType) =>
      PlayingMovieProvider._(argument: sortType, from: this);

  @override
  String toString() => r'playingMovieProvider';
}

abstract class _$PlayingMovie extends $AsyncNotifier<MovieResultEntity> {
  late final _$args = ref.$arg as MovieSortType;
  MovieSortType get sortType => _$args;

  FutureOr<MovieResultEntity> build(MovieSortType sortType);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
