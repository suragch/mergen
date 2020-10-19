import 'package:mergen/domain/search/search_string.dart';

abstract class DictionaryService {
  Future<List<String>> wordsStartingWith(SearchString prefix);
}

class FakeDictionary implements DictionaryService {
  @override
  Future<List<String>> wordsStartingWith(SearchString prefix) {
    return Future.value(europeanCountries
        .where((country) =>
            country.toLowerCase().startsWith(prefix.value.toLowerCase()))
        .toList());
  }
}

final europeanCountries = [
  'Albania',
  'Andorra',
  'Armenia',
  'Austria',
  'Azerbaijan',
  'Belarus',
  'Belgium',
  'Bosnia and Herzegovina',
  'Bulgaria',
  'Croatia',
  'Cyprus',
  'Czech Republic',
  'Denmark',
  'Estonia',
  'Finland',
  'France',
  'Georgia',
  'Germany',
  'Greece',
  'Hungary',
  'Iceland',
  'Ireland',
  'Italy',
  'Kazakhstan',
  'Kosovo',
  'Latvia',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Macedonia',
  'Malta',
  'Moldova',
  'Monaco',
  'Montenegro',
  'Netherlands',
  'Norway',
  'Poland',
  'Portugal',
  'Romania',
  'Russia',
  'San Marino',
  'Serbia',
  'Slovakia',
  'Slovenia',
  'Spain',
  'Sweden',
  'Switzerland',
  'Turkey',
  'Ukraine',
  'United Kingdom',
  'Vatican City'
];
