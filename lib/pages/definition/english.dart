import 'package:flutter/material.dart';
import 'package:mergen/services/service_locator.dart';
import 'package:mongol/mongol.dart';

import 'english_definitions_notifier.dart';

class EnglishDefinition extends StatefulWidget {
  EnglishDefinition({
    Key key,
    this.word,
  }) : super(key: key);
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
          final definition = value[index] as EnglishWordPresentation;
          return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                  child: Text(
                    definition.word,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                if (definition.baseForm.isNotEmpty) Center(child: Text(definition.baseForm)),
                Center(child: Text(definition.partOfSpeach)),
                Text(definition.glossCyrillic, style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text(definition.descriptionCyrillic),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MongolText(
                        definition.glossMongol,
                        style:
                            TextStyle(fontFamily: 'MenksoftQagan', fontSize: 34),
                      ),
                      MongolText(
                        definition.descriptionMongol,
                        style:
                            TextStyle(fontFamily: 'MenksoftQagan', fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                for (final example in definition.examples) Text(example),
            ],
          ),
              ));
        },
      ),
    );
  }
}