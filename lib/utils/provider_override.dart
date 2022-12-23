import 'package:flutter_riverpod/flutter_riverpod.dart';

T needsOverride<T>(ProviderRef<T> _) =>
    throw UnimplementedError('Provider must be overridden');

extension MapToOverride on Map<Provider<Object>, Object> {
  List<Override> toOverrides() =>
      entries.map((e) => e.key.overrideWithValue(e.value)).toList();
}
