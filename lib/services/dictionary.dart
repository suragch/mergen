import 'package:mergen/domain/dictionary/english_word.dart';
import 'package:mergen/domain/dictionary/example_sentence.dart';
import 'package:mergen/domain/dictionary/part_of_speech.dart';
import 'package:mergen/domain/dictionary/pronunciation.dart';

abstract class DictionaryService {
  Future<List<String>> wordsStartingWith(String prefix);
  Future<List<EnglishWord>> definitionOf(String word);
}

class OnlineDictionary implements DictionaryService {
  @override
  Future<List<EnglishWord>> definitionOf(String word) {
    // TODO: implement definitionOf
    throw UnimplementedError();
  }

  @override
  Future<List<String>> wordsStartingWith(String prefix) {
    // TODO: implement wordsStartingWith
    throw UnimplementedError();
  }
}

class FakeDictionary implements DictionaryService {
  @override
  Future<List<String>> wordsStartingWith(String prefix) {
    if (prefix.isEmpty) {
      return Future.value([]);
    }
    return Future.value(europeanCountries
        .where(
            (country) => country.toLowerCase().startsWith(prefix.toLowerCase()))
        .toList());
  }

  @override
  Future<List<EnglishWord>> definitionOf(String word) {
    return Future.value(
      [
        EnglishWord(
          'hours',
          baseForm: 'hour',
          pronunciations: [
            Pronunciation(
              locale: EnglishWord.americanEnglish,
              ipa: 'aʊərz',
              audio: Uri(path: 'hours.mp3'),
            ),
            Pronunciation(
              locale: EnglishWord.britishEnglish,
              ipa: 'aʊəz',
              audio: Uri(path: 'hours.mp3'),
            ),
          ],
          partOfSpeach: EnglishPartOfSpeech.noun,
          glossCyrillic: 'цаг',
          glossMongol: 'ᠴᠠᠭ',
          descriptionCyrillic:
              'Үргэлжид хөгжих материйн орших ахуйн бодит хэлбэр: цаг цагаараа байдаггүй цахилдаг хөхөөрөө дэлгэрэнгүй... [зүйр цэцэн үг] (юм үргэлж хувирч өөрчлөгдөж, хөгжиж байдаг гэсэн санаа).',
          descriptionMongol:
              'ᠦᠷᠭᠦᠯᠵᠢᠳᠡ ᠬᠦᠭᠵᠢᠬᠦ ᠮᠠᠲ᠋ᠧᠷᠢ ᠶᠢᠨ ᠣᠷᠣᠰᠢᠬᠤ ᠠᠬᠤᠢ ᠶᠢᠨ ᠪᠣᠳᠠᠲᠤ ᠬᠡᠯᠪᠡᠷᠢ᠄ ᠴᠠᠭ ᠴᠠᠭ ᠢᠶᠠᠷ ᠢᠶᠠᠨ ᠪᠠᠶᠢᠳᠠᠭ ᠦᠭᠡᠢ ᠴᠠᠬᠢᠯᠳᠠᠭ ᠬᠥᠬᠡ ᠪᠡᠷ ᠢᠶᠡᠨ ᠳᠡᠯᠭᠡᠷᠡᠩᠭᠦᠢ 〔ᠵᠦᠢᠷ ᠰᠡᠴᠡᠨ ᠦᠭᠡ〕 (ᠶᠤᠮ ᠦᠷᠭᠦᠯᠵᠢ ᠬᠤᠪᠢᠷᠠᠵᠤ ᠥᠭᠡᠷᠡᠴᠢᠯᠡᠭᠳᠡᠵᠦ᠂ ᠬᠥᠭᠵᠢᠵᠦ ᠪᠠᠶᠢᠳᠠᠭ ᠭᠡᠰᠡᠨ ᠰᠠᠨᠠᠭ᠎ᠠ)᠃',
          examples: [
            ExampleSentence(
              'There are 24 hours in a day.',
              source: 'VocuCard',
              pronunciations: [
                Pronunciation(
                  audio: Uri(path: 'thereare24hours.mp3'),
                ),
              ],
            ),
            ExampleSentence(
              'How many hours will the flight take?',
              source: '',
              pronunciations: [
                Pronunciation(
                  audio: Uri(path: 'howmanyhours.mp3'),
                ),
              ],
            )
          ],
          tags: ['time'],
        ),
        EnglishWord(
          'hours',
          partOfSpeach: EnglishPartOfSpeech.noun,
          glossCyrillic: 'цаг',
          glossMongol: 'ᠠᠵᠢᠯ ᠤᠨ ᠴᠠᠭ',
          descriptionCyrillic:
              'Үргэлжид хөгжих материйн орших ахуйн бодит хэлбэр: цаг цагаараа байдаггүй цахилдаг хөхөөрөө дэлгэрэнгүй... [зүйр цэцэн үг] (юм үргэлж хувирч өөрчлөгдөж, хөгжиж байдаг гэсэн санаа).',
          descriptionMongol:
              'ᠦᠷᠭᠦᠯᠵᠢᠳᠡ ᠬᠦᠭᠵᠢᠬᠦ ᠮᠠᠲ᠋ᠧᠷᠢ ᠶᠢᠨ ᠣᠷᠣᠰᠢᠬᠤ ᠠᠬᠤᠢ ᠶᠢᠨ ᠪᠣᠳᠠᠲᠤ ᠬᠡᠯᠪᠡᠷᠢ᠄ ᠴᠠᠭ ᠴᠠᠭ ᠢᠶᠠᠷ ᠢᠶᠠᠨ ᠪᠠᠶᠢᠳᠠᠭ ᠦᠭᠡᠢ ᠴᠠᠬᠢᠯᠳᠠᠭ ᠬᠥᠬᠡ ᠪᠡᠷ ᠢᠶᠡᠨ ᠳᠡᠯᠭᠡᠷᠡᠩᠭᠦᠢ 〔ᠵᠦᠢᠷ ᠰᠡᠴᠡᠨ ᠦᠭᠡ〕 (ᠶᠤᠮ ᠦᠷᠭᠦᠯᠵᠢ ᠬᠤᠪᠢᠷᠠᠵᠤ ᠥᠭᠡᠷᠡᠴᠢᠯᠡᠭᠳᠡᠵᠦ᠂ ᠬᠥᠭᠵᠢᠵᠦ ᠪᠠᠶᠢᠳᠠᠭ ᠭᠡᠰᠡᠨ ᠰᠠᠨᠠᠭ᠎ᠠ)᠃',
          examples: [
            ExampleSentence(
              'My hours at work got cut.',
            ),
            ExampleSentence(
              'I had to work long hours.',
            )
          ],
        )
      ],
    );
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
