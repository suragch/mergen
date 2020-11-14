import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddWordPage extends StatefulWidget {
  const AddWordPage({
    Key key,
    //this.word,
  }) : super(key: key);
  //final String word;

  @override
  _AddWordPageState createState() => _AddWordPageState();
}

class _AddWordPageState extends State<AddWordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddWordBody(),
    );
  }
}

class AddWordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dog', style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            PartOfSpeech(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'IPA (American English)',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'IPA (British English)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Translation (Cyrillic)',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Translation (Bichig)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description (Cyrillic)',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description (Bichig)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Example sentence',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartOfSpeech extends StatefulWidget {
  const PartOfSpeech({
    Key key,
  }) : super(key: key);

  @override
  _PartOfSpeechState createState() => _PartOfSpeechState();
}

class _PartOfSpeechState extends State<PartOfSpeech> {
  String dropdownValue = 'Part of Speech';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Part of Speech', 'noun', 'verb', 'adjective', 'adverb']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
