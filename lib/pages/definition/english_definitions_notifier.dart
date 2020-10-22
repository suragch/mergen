import 'package:flutter/foundation.dart';
import 'package:mergen/domain/dictionary/english_word.dart';
import 'package:mergen/domain/search/search_string.dart';
import 'package:mergen/services/dictionary.dart';
import 'package:mergen/services/service_locator.dart';

class EnglishDefinitionsNotifier extends ValueNotifier<List<EnglishWord>> {
  EnglishDefinitionsNotifier() : super(initialState);
  static const initialState = <EnglishWord>[];

  final dictionary = locator<DictionaryService>();

  Future<void> search(String word) async {
    final validatedWord = SearchString(word);
    value = await dictionary.definitionOf(validatedWord);
  }
}