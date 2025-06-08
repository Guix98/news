// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$domainsHash() => r'5795314cf6589ec1cec6494272575887045a1be5';

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

/// See also [domains].
@ProviderFor(domains)
const domainsProvider = DomainsFamily();

/// See also [domains].
class DomainsFamily extends Family<AsyncValue<List<Article>>> {
  /// See also [domains].
  const DomainsFamily();

  /// See also [domains].
  DomainsProvider call(String domain) {
    return DomainsProvider(domain);
  }

  @override
  DomainsProvider getProviderOverride(covariant DomainsProvider provider) {
    return call(provider.domain);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'domainsProvider';
}

/// See also [domains].
class DomainsProvider extends AutoDisposeFutureProvider<List<Article>> {
  /// See also [domains].
  DomainsProvider(String domain)
    : this._internal(
        (ref) => domains(ref as DomainsRef, domain),
        from: domainsProvider,
        name: r'domainsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$domainsHash,
        dependencies: DomainsFamily._dependencies,
        allTransitiveDependencies: DomainsFamily._allTransitiveDependencies,
        domain: domain,
      );

  DomainsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.domain,
  }) : super.internal();

  final String domain;

  @override
  Override overrideWith(
    FutureOr<List<Article>> Function(DomainsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DomainsProvider._internal(
        (ref) => create(ref as DomainsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        domain: domain,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Article>> createElement() {
    return _DomainsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DomainsProvider && other.domain == domain;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, domain.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DomainsRef on AutoDisposeFutureProviderRef<List<Article>> {
  /// The parameter `domain` of this provider.
  String get domain;
}

class _DomainsProviderElement
    extends AutoDisposeFutureProviderElement<List<Article>>
    with DomainsRef {
  _DomainsProviderElement(super.provider);

  @override
  String get domain => (origin as DomainsProvider).domain;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
