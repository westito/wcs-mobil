import 'dart:collection';

class SearchableList<T> extends ListBase<T> {
  final List<T> _list;
  final Map<String, int> _map;

  SearchableList(this._list, List<String?> Function(T) wordsExtractor)
      : _map = {
          for (var index = 0; index < _list.length; index++)
            for (var word in wordsExtractor(_list[index]))
              if (word != null && word.isNotEmpty) word.toLowerCase(): index,
        };

  List<T> filter(String phrase) => UnmodifiableListView<T>(_map.entries
      .where((e) => e.key.startsWith(phrase))
      .map((e) => e.value)
      .toSet()
      .map((e) => _list[e]));

  @override
  int get length => _list.length;

  @override
  set length(int length) => throw UnsupportedError('Cannot change length');

  @override
  void operator []=(int index, T value) =>
      throw UnsupportedError('Cannot change elements');

  @override
  T operator [](int index) => _list[index];
}
