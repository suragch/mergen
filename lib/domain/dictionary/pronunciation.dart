import 'dart:ui';

import 'package:equatable/equatable.dart';

class Pronunciation extends Equatable {
  /// The written and/or spoken pronunciation of an expression (word, phrase,
  /// sentence, etc.)
  Pronunciation(
    this.locale,
    this.ipa,
    this.audio,
  );

  /// The location where this pronunciation is used.
  final Locale locale;

  /// The International Phonetic Alphabet (IPA) rendering of the expression.
  final String ipa;

  /// A link to the audio pronunciation of the expression.
  final Uri audio;

  @override
  List<Object> get props => [
        locale,
        ipa,
        audio,
      ];
}

