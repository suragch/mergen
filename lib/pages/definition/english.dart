import 'package:flutter/material.dart';
import 'package:mergen/domain/dictionary/english_word.dart';
import 'package:mergen/services/service_locator.dart';

import 'english_definitions_notifier.dart';

class EnglishDefinition extends StatefulWidget {
  EnglishDefinition({Key key, this.word,}) : super(key: key);
  final String word;

  @override
  _EnglishDefinitionState createState() => _EnglishDefinitionState();
}

class _EnglishDefinitionState extends State<EnglishDefinition> {
  @override
  void initState() {
    final notifier = locator<EnglishDefinitionsNotifier>();
    notifier.search(widget.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: DefinitionBody(),
    );
  }
}

class DefinitionBody extends StatelessWidget {
  const DefinitionBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locator<EnglishDefinitionsNotifier>(),
      builder: (context, value, child) => ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          final definition = value[index] as EnglishWord;
          return Card(
            child: Text(definition.word)
          );
        },
      ),
    );
  }
}