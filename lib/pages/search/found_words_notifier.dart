

import 'package:flutter/foundation.dart';
import 'package:mergen/domain/search/search_string.dart';
import 'package:mergen/services/dictionary.dart';
import 'package:mergen/services/service_locator.dart';

class FoundWordsNotifier extends ValueNotifier<List<String>> {
  FoundWordsNotifier() : super(initialState);
  static const initialState = <String>[];

  final dictionary = locator<DictionaryService>();

  Future<void> search(String prefix) async {
    final validatedPrefix = SearchString(prefix);
    value = await dictionary.wordsStartingWith(validatedPrefix);
  }

}