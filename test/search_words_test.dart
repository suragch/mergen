import 'package:mergen/domain/search/search_string.dart';
import 'package:mergen/pages/search/found_words_notifier.dart';
import 'package:mergen/services/dictionary.dart';
import 'package:mergen/services/service_locator.dart';
import 'package:test/test.dart';

void main() {

  setUpAll(() {
    setupServiceLocator();
    locator.allowReassignment = true;
  });
  
  test('Initial state is empty word choice list', () {
    final notifier = FoundWordsNotifier();
    expect(notifier, isNotNull);
    expect(notifier.value, equals(<String>[]));
  });

  test('Searching for string gives non-empty list', () async {
    // I don't know if I like mocking here because it assumes knowlege of 
    // implementation details.
    final mockRepo = FakeDictionary();
    locator.registerSingleton<DictionaryService>(mockRepo);

    final notifier = FoundWordsNotifier();
    expect(notifier, isNotNull);

    await notifier.search('a');
    expect(notifier.value.length, greaterThan(0));
  });

}