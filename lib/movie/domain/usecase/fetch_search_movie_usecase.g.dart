// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_search_movie_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchSearchMovieUseCase)
const fetchSearchMovieUseCaseProvider = FetchSearchMovieUseCaseProvider._();

final class FetchSearchMovieUseCaseProvider
    extends
        $FunctionalProvider<
          FetchSearchMovieUseCase,
          FetchSearchMovieUseCase,
          FetchSearchMovieUseCase
        >
    with $Provider<FetchSearchMovieUseCase> {
  const FetchSearchMovieUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchSearchMovieUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchSearchMovieUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchSearchMovieUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchSearchMovieUseCase create(Ref ref) {
    return fetchSearchMovieUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchSearchMovieUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchSearchMovieUseCase>(value),
    );
  }
}

String _$fetchSearchMovieUseCaseHash() =>
    r'28b6bb093fa7da47bf6d15c3e4897d97eb85abb9';
