// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copyright.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$copyrightHash() => r'cdc95dcaf851e25567e3c0c9d93c71c6ceb44f82';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [copyright].
@ProviderFor(copyright)
const copyrightProvider = CopyrightFamily();

/// See also [copyright].
class CopyrightFamily extends Family<AsyncValue<String?>> {
  /// See also [copyright].
  const CopyrightFamily();

  /// See also [copyright].
  CopyrightProvider call({
    required LatLng latLng,
    required LatLngBounds bounds,
  }) {
    return CopyrightProvider(
      latLng: latLng,
      bounds: bounds,
    );
  }

  @override
  CopyrightProvider getProviderOverride(
    covariant CopyrightProvider provider,
  ) {
    return call(
      latLng: provider.latLng,
      bounds: provider.bounds,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'copyrightProvider';
}

/// See also [copyright].
class CopyrightProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [copyright].
  CopyrightProvider({
    required LatLng latLng,
    required LatLngBounds bounds,
  }) : this._internal(
          (ref) => copyright(
            ref as CopyrightRef,
            latLng: latLng,
            bounds: bounds,
          ),
          from: copyrightProvider,
          name: r'copyrightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$copyrightHash,
          dependencies: CopyrightFamily._dependencies,
          allTransitiveDependencies: CopyrightFamily._allTransitiveDependencies,
          latLng: latLng,
          bounds: bounds,
        );

  CopyrightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latLng,
    required this.bounds,
  }) : super.internal();

  final LatLng latLng;
  final LatLngBounds bounds;

  @override
  Override overrideWith(
    FutureOr<String?> Function(CopyrightRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CopyrightProvider._internal(
        (ref) => create(ref as CopyrightRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latLng: latLng,
        bounds: bounds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _CopyrightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CopyrightProvider &&
        other.latLng == latLng &&
        other.bounds == bounds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latLng.hashCode);
    hash = _SystemHash.combine(hash, bounds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CopyrightRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `latLng` of this provider.
  LatLng get latLng;

  /// The parameter `bounds` of this provider.
  LatLngBounds get bounds;
}

class _CopyrightProviderElement
    extends AutoDisposeFutureProviderElement<String?> with CopyrightRef {
  _CopyrightProviderElement(super.provider);

  @override
  LatLng get latLng => (origin as CopyrightProvider).latLng;
  @override
  LatLngBounds get bounds => (origin as CopyrightProvider).bounds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
