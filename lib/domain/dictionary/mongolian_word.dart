import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'example_sentence.dart';
import 'part_of_speech.dart';
import 'pronunciation.dart';

/// This is a Mongolian dictionary entry.
///
/// The [word] can also be a phrase.
@immutable
class MongolianWord extends Equatable {
  MongolianWord(
    this.word, {
    this.bichig,
    this.bichigSpelling,
    this.locale = khalkhaMongolian,
    this.targetLanguage,
    this.baseForm,
    this.pronunciation,
    this.partOfSpeach,
    this.gloss,
    this.descriptionCyrillic,
    this.descriptionMongol,
    this.examples,
    this.tags,
  });

  /// Any Mongolian word or phrase in Cyrillic representing a single meaning.
  ///
  /// If you want to add an additional meaning then you should create a new
  /// instance of [MongolianWord].
  final String word;

  /// The traditional Mongolian script version of [word].
  final String bichig;

  /// The disambiguated spelling of [bichig].
  final String bichigSpelling;

  /// The location where the word is used.
  ///
  /// For example, if [word] is used in Mongolia but not in Inner Mongolia,
  /// this should be marked. Additionally, if this meaning of [word] only
  /// applies to a particular location, this should be marked. For example,
  /// 'алим' means 'apple' in Mongolia but 'pear' in Inner Mongolia. Thus,
  /// there should be two separate instances of [MongolianWord] for each of
  /// these meanings.
  ///
  /// The default is [khalkhaMongolian].
  final Locale locale;

  static const khalkhaMongolian = Locale('mn', 'MN');
  static const innerMongolian = Locale('mn', 'CN');

  /// The language that [word] is being defined in.
  ///
  /// The default is English.
  final String targetLanguage;

  /// The base form of [word].
  ///
  /// For example, if [word] is 'авсан' then [baseForm] should be
  /// 'авах'. Or if [word] is 'хүмүүс' then [baseForm] should be 'хүн'.
  final String baseForm;

  /// The written and spoken pronunciation(s) of [word]. 
  /// 
  /// You can add a pronunciation for [khalkhaMongolian] and [innerMongolian].
  final List<Pronunciation> pronunciation;

  /// The part of speach for [word], whether verb, noun, etc.
  final MongolPartOfSpeech partOfSpeach;

  /// A basic translation of [word] into [targetLanguage].
  ///
  /// A single word translation is best but not more than three words.
  final String gloss;

  /// A longer description of [word] using the Cyrillic alphabet.
  final String descriptionCyrillic;

  /// A longer description of [word] using the traditional Mongolian script.
  final String descriptionMongol;

  /// A list of example sentences that use [word].
  ///
  /// The sentences should specifically use the form in [word] and/or [bichig],
  /// not [baseForm] or another form.
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
        bichig,
        bichigSpelling,
        locale,
        targetLanguage,
        baseForm,
        pronunciation,
        partOfSpeach,
        gloss,
        descriptionCyrillic,
        descriptionMongol,
        examples,
        tags,
      ];
}