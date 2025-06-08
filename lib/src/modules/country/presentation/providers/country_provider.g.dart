// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countryHash() => r'dbfd4425dece96b46d43fc7506e0086e382326ea';

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

/// See also [country].
@ProviderFor(country)
const countryProvider = CountryFamily();

/// See also [country].
class CountryFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [country].
  const CountryFamily();

  /// See also [country].
  CountryProvider call(String code) {
    return CountryProvider(code);
  }

  @override
  CountryProvider getProviderOverride(covariant CountryProvider provider) {
    return call(provider.code);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'countryProvider';
}

/// See also [country].
class CountryProvider extends AutoDisposeFutureProvider<List<Article>> {
  /// See also [country].
  CountryProvider(String code)
    : this._internal(
        (ref) => country(ref as CountryRef, code),
        from: countryProvider,
        name: r'countryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$countryHash,
        dependencies: CountryFamily._dependencies,
        allTransitiveDependencies: CountryFamily._allTransitiveDependencies,
        code: code,
      );

  CountryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
  }) : super.internal();

  final String code;

  @override
  Override overrideWith(
    FutureOr<List<Article>> Function(CountryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CountryProvider._internal(
        (ref) => create(ref as CountryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Article>> createElement() {
    return _CountryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountryProvider && other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CountryRef on AutoDisposeFutureProviderRef<List<Article>> {
  /// The parameter `code` of this provider.
  String get code;
}

class _CountryProviderElement
    extends AutoDisposeFutureProviderElement<List<Article>>
    with CountryRef {
  _CountryProviderElement(super.provider);

  @override
  String get code => (origin as CountryProvider).code;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
