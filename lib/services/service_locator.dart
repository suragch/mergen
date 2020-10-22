
import 'package:get_it/get_it.dart';
import 'package:mergen/pages/definition/english_definitions_notifier.dart';
import 'package:mergen/pages/search/found_words_notifier.dart';

import 'dictionary.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<DictionaryService>(() => FakeDictionary());

  locator.registerLazySingleton<FoundWordsNotifier>(() => FoundWordsNotifier());
  locator.registerLazySingleton<EnglishDefinitionsNotifier>(() => EnglishDefinitionsNotifier());
}