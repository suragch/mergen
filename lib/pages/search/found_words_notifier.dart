

import 'package:flutter/foundation.dart';
import 'package:mergen/domain/search/search_string.dart';
import 'package:mergen/services/dictionary.dart';
import 'package:mergen/services/service_locator.dart';

import 'search_state.dart';

class FoundWordsNotifier extends ValueNotifier<SearchState> {
  FoundWordsNotifier() : super(initialState);
  static const initialState = SearchState('', []);

  final dictionary = locator<DictionaryService>();

  Future<void> search(String prefix) async {
    //final validatedPrefix = SearchString(prefix);
    final results = await dictionary.wordsStartingWith(prefix);
    value = SearchState(prefix, results);
  }

}