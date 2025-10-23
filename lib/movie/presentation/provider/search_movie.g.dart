// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchMovie)
const searchMovieProvider = SearchMovieFamily._();

final class SearchMovieProvider
    extends $AsyncNotifierProvider<SearchMovie, MovieListEntity> {
  const SearchMovieProvider._({
    required SearchMovieFamily super.from,
    required (String, MovieSortType) super.argument,
  }) : super(
         retry: null,
         name: r'searchMovieProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchMovieHash();

  @override
  String toString() {
    return r'searchMovieProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SearchMovie create() => SearchMovie();

  @override
  bool operator ==(Object other) {
    return other is SearchMovieProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchMovieHash() => r'9992af2408735ece778933a723f208107d74a3ca';

final class SearchMovieFamily extends $Family
    with
        $ClassFamilyOverride<
          SearchMovie,
          AsyncValue<MovieListEntity>,
          MovieListEntity,
          FutureOr<MovieListEntity>,
          (String, MovieSortType)
        > {
  const SearchMovieFamily._()
    : super(
        retry: null,
        name: r'searchMovieProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchMovieProvider call(String query, MovieSortType sortType) =>
      SearchMovieProvider._(argument: (query, sortType), from: this);

  @override
  String toString() => r'searchMovieProvider';
}

abstract class _$SearchMovie extends $AsyncNotifier<MovieListEntity> {
  late final _$args = ref.$arg as (String, MovieSortType);
  String get query => _$args.$1;
  MovieSortType get sortType => _$args.$2;

  FutureOr<MovieListEntity> build(String query, MovieSortType sortType);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<MovieListEntity>, MovieListEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieListEntity>, MovieListEntity>,
              AsyncValue<MovieListEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
