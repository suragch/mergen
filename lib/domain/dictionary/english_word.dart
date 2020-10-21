import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'example_sentence.dart';
import 'part_of_speech.dart';
import 'pronunciation.dart';

/// This is an English-to-Mongolian dictionary entry.
///
/// The [word] can also be a phrase.
@immutable
class EnglishWord extends Equatable {
  EnglishWord(
    this.word, {
    this.baseForm,
    this.locale = americanEnglish,
    this.pronunciation,
    this.partOfSpeach,
    @required this.glossCyrillic,
    this.glossMongol,
    this.descriptionCyrillic,
    this.descriptionMongol,
    this.examples,
    this.tags,
  });

  /// Any English word or phrase representing a single meaning.
  ///
  /// If you want to add an additional meaning then you should create a new
  /// instance of [EnglishWord].
  final String word;

  /// The base form of [word].
  ///
  /// For example, if [word] is 'ran' then [baseForm] should be 'run'. Or if
  /// [word] is 'boys' then [baseForm] should be 'boy'.
  final String baseForm;

  /// The location where the [word] is used.
  ///
  /// For example, if [word] is used in the US but not in the UK,
  /// this should be marked. Additionally, if this meaning of [word] only
  /// applies to a particular location, this should be marked. For example,
  /// 'pants' has one meaning in the US and another meaning in the UK. Thus,
  /// there should be two separate instances of [EnglishWord] for each of
  /// these meanings.
  ///
  /// The default is American English.
  final Locale locale;

  static const americanEnglish = Locale('en', 'US');
  static const britishEnglish = Locale('en', 'GB');

  /// The written (IPA) and spoken (link to an audio file) pronunciation
  /// of [word].
  /// 
  /// You can add a pronunciation for [americanEnglish] and [britishEnglish].
  final List<Pronunciation> pronunciation;

  /// The part of speach for [word], whether verb, noun, etc.
  final EnglishPartOfSpeech partOfSpeach;

  /// A basic translation of [word] into Mongolian using the Cyrillic alphabet.
  ///
  /// A single word translation is best but not more than three words.
  /// This and [glossMongol] should be transliterations of each other.
  final String glossCyrillic;

  /// A basic translation of [word] into Mongolian using the traditional
  /// Mongolian script.
  ///
  /// A single word translation is best but not more than
  /// three words. This and [glossCyrillic] should be transliterations of each
  /// other.
  final String glossMongol;

  /// A longer description of [word] using the Cyrillic alphabet.
  final String descriptionCyrillic;

  /// A longer description of [word] using the traditional Mongolian script.
  final String descriptionMongol;

  /// A list of example sentences that use [word].
  ///
  /// The sentences should specifically use [word] and not [baseForm] or another
  /// form.
  final List<ExampleSentence> examples;

  /// A list of subject tags that may apply to [word].
  ///
  /// For example, ['biology', 'insect']. This is mainly to support grouping
  /// technical or field-specific vocabulary. Common words probably don't need
  /// a tag.
  final List<String> tags;

  @override
  List<Object> get props => [
        word,
        baseForm,
        locale,
        pronunciation,
        partOfSpeach,
        glossCyrillic,
        glossMongol,
        descriptionCyrillic,
        descriptionMongol,
        examples,
        tags,
      ];
}



