// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, type_annotate_public_apis

part of 'season_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $_SeasonScreenControllerHash() =>
    r'b8a3fbf59f1942528125c274e957b802e3dac230';

/// See also [_SeasonScreenController].
class _SeasonScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<_SeasonScreenController,
        List<Driver>> {
  _SeasonScreenControllerProvider(
    this.year,
  ) : super(
          () => _SeasonScreenController()..year = year,
          from: _seasonScreenControllerProvider,
          name: r'_seasonScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $_SeasonScreenControllerHash,
        );

  final String year;

  @override
  bool operator ==(Object other) {
    return other is _SeasonScreenControllerProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Driver>> runNotifierBuild(
    covariant _$SeasonScreenController notifier,
  ) {
    return notifier.build(
      year,
    );
  }
}

typedef _SeasonScreenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<List<Driver>>;

/// See also [_SeasonScreenController].
final _seasonScreenControllerProvider = _SeasonScreenControllerFamily();

class _SeasonScreenControllerFamily extends Family<AsyncValue<List<Driver>>> {
  _SeasonScreenControllerFamily();

  _SeasonScreenControllerProvider call(
    String year,
  ) {
    return _SeasonScreenControllerProvider(
      year,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<_SeasonScreenController, List<Driver>>
      getProviderOverride(
    covariant _SeasonScreenControllerProvider provider,
  ) {
    return call(
      provider.year,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'_seasonScreenControllerProvider';
}

abstract class _$SeasonScreenController
    extends BuildlessAutoDisposeAsyncNotifier<List<Driver>> {
  late final String year;

  FutureOr<List<Driver>> build(
    String year,
  );
}
