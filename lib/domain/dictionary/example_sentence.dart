import 'package:equatable/equatable.dart';

import 'pronunciation.dart';

class ExampleSentence extends Equatable {
  /// A written and audio example sentence demonstrating the usage of some word
  /// or phrase.
  ExampleSentence(
    this.sentence, {
    this.source,
    this.pronunciations,
  });

  /// A sentence to show how a word or phrase is used in context.
  ///
  /// A good example sentence would allow you to guess the word even if it were
  /// missing. For example, 'I like cats' is a poor example sentence for the
  /// word 'cats' because the other words in the sentence give very little
  /// additional meaning. However, the sentence 'Dogs often like to chase cats'
  /// is much better.
  ///
  /// The sentence should idealy be an original creation by a native speaker. If
  /// taken from another source, though, then the citation should be recorded in
  /// [source].
  final String sentence;

  /// The source of the [sentence].
  ///
  /// If the source is a native speaker who has directly entered the [sentence]
  /// into the app, then [source] can be left empty.
  final String source;

  /// The pronunciation(s) of [sentence];
  final List<Pronunciation> pronunciations;

  @override
  List<Object> get props => [sentence, source, pronunciations];
}
