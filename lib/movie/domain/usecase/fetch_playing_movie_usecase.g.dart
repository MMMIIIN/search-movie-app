// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_playing_movie_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchPlayingMovieUseCase)
const fetchPlayingMovieUseCaseProvider = FetchPlayingMovieUseCaseProvider._();

final class FetchPlayingMovieUseCaseProvider
    extends
        $FunctionalProvider<
          FetchPlayingMovieUseCase,
          FetchPlayingMovieUseCase,
          FetchPlayingMovieUseCase
        >
    with $Provider<FetchPlayingMovieUseCase> {
  const FetchPlayingMovieUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchPlayingMovieUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchPlayingMovieUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchPlayingMovieUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchPlayingMovieUseCase create(Ref ref) {
    return fetchPlayingMovieUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchPlayingMovieUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchPlayingMovieUseCase>(value),
    );
  }
}

String _$fetchPlayingMovieUseCaseHash() =>
    r'945c664d146c0cd030567e9424135db68a65a920';
