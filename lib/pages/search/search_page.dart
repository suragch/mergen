import 'package:flutter/material.dart';
import 'package:mergen/pages/definition/english.dart';
import 'package:mergen/pages/search/found_words_notifier.dart';
import 'package:mergen/services/service_locator.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Mergen'),
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('building SearchBody');
    return Column(
      children: [
        SearchInput(),
        SearchResults(),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
          onChanged: (value) {
            locator<FoundWordsNotifier>().search(value);
          },
        ),
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: locator<FoundWordsNotifier>(),
        builder: (context, value, child) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final word = value[index];
            return ListTile(
              title: Text(word),
              onTap: () {
                _navigateToEnglishDefinition(context, word);
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToEnglishDefinition(BuildContext context, String word) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnglishDefinition(
          word: word,
        ),
      ),
    );
  }
}
