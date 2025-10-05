// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'b01411b2ccade2e64bb8eb7978c3b781bad5283d';

@ProviderFor(movieRemoteDataSource)
const movieRemoteDataSourceProvider = MovieRemoteDataSourceProvider._();

final class MovieRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          MovieRemoteDataSource,
          MovieRemoteDataSource,
          MovieRemoteDataSource
        >
    with $Provider<MovieRemoteDataSource> {
  const MovieRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<MovieRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MovieRemoteDataSource create(Ref ref) {
    return movieRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieRemoteDataSource>(value),
    );
  }
}

String _$movieRemoteDataSourceHash() =>
    r'e29fb86e23dba5a1502fbe6e1784eb729dc98b73';
