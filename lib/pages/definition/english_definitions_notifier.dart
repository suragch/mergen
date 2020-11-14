import 'package:flutter/foundation.dart';
import 'package:mergen/domain/dictionary/english_word.dart';
import 'package:mergen/domain/dictionary/example_sentence.dart';
import 'package:mergen/domain/dictionary/part_of_speech.dart';
import 'package:mergen/services/dictionary.dart';
import 'package:mergen/services/service_locator.dart';

class EnglishDefinitionsNotifier
    extends ValueNotifier<List<EnglishWordPresentation>> {
  EnglishDefinitionsNotifier() : super(initialState);
  static const initialState = <EnglishWordPresentation>[];

  final dictionary = locator<DictionaryService>();

  Future<void> search(String word) async {
    //final validatedWord = String(word);
    final englishWord = await dictionary.definitionOf(word);
    value = _presentable(englishWord);
  }
}

List<EnglishWordPresentation> _presentable(List<EnglishWord> words) {
  final presentableWords = <EnglishWordPresentation>[];
  for (final word in words) {
    final partOfSpeach = _extractPartOfSpeach(word.partOfSpeach);
    final baseForm = word.baseForm == null ? '' : '(${word.baseForm})';
    final exampleSentences = _extractExampleSentences(word.examples);
    final newPresentableWord = EnglishWordPresentation(
      word.word,
      baseForm: baseForm,
      partOfSpeach: partOfSpeach,
      glossCyrillic: word.glossCyrillic,
      glossMongol: word.glossMongol,
      descriptionCyrillic: word.descriptionCyrillic,
      descriptionMongol: word.descriptionMongol,
      examples: exampleSentences,
    );
    presentableWords.add(newPresentableWord);
  }
  return presentableWords;
}



String _extractPartOfSpeach(EnglishPartOfSpeech partOfSpeech) {
  switch (partOfSpeech) {
    case EnglishPartOfSpeech.noun:
      return 'noun';
    case EnglishPartOfSpeech.verb:
      return 'verb';
    case EnglishPartOfSpeech.adjective:
      return 'adjective';
    case EnglishPartOfSpeech.adverb:
      return 'adverb';
    case EnglishPartOfSpeech.pronoun:
      return 'pronoun';
    case EnglishPartOfSpeech.preposition:
      return 'preposition';
    case EnglishPartOfSpeech.conjunction:
      return 'conjunction';
    case EnglishPartOfSpeech.interjection:
      return 'interjection';
    case EnglishPartOfSpeech.article:
      return 'article';
  }
}

List<String> _extractExampleSentences(List<ExampleSentence> examples) {
  final sentences = <String>[];
  for (final example in examples) {
    sentences.add(example.sentence);
  }
  return sentences;
}

class EnglishWordPresentation {
  EnglishWordPresentation(
    this.word, {
    this.baseForm,
    //this.locale = americanEnglish,
    //this.pronunciations,
    this.partOfSpeach,
    @required this.glossCyrillic,
    this.glossMongol,
    this.descriptionCyrillic,
    this.descriptionMongol,
    this.examples,
    //this.tags,
  });

  final String word;
  final String baseForm;
  final String partOfSpeach;
  final String glossCyrillic;
  final String glossMongol;
  final String descriptionCyrillic;
  final String descriptionMongol;
  final List<String> examples;
}
