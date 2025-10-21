// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_movies_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sortMoviesUseCase)
const sortMoviesUseCaseProvider = SortMoviesUseCaseProvider._();

final class SortMoviesUseCaseProvider
    extends
        $FunctionalProvider<
          SortMoviesUseCase,
          SortMoviesUseCase,
          SortMoviesUseCase
        >
    with $Provider<SortMoviesUseCase> {
  const SortMoviesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortMoviesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortMoviesUseCaseHash();

  @$internal
  @override
  $ProviderElement<SortMoviesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SortMoviesUseCase create(Ref ref) {
    return sortMoviesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortMoviesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortMoviesUseCase>(value),
    );
  }
}

String _$sortMoviesUseCaseHash() => r'2373859d539b05bf3663c2003bf6d9c392afa748';
