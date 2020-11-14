import 'package:flutter/material.dart';
import 'package:mergen/pages/add_word/add_word_page.dart';
import 'package:mergen/pages/definition/english.dart';
import 'package:mergen/pages/search/found_words_notifier.dart';
import 'package:mergen/services/service_locator.dart';

import 'search_state.dart';

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
        builder: (context, SearchState value, child) {
          if (value.searchTerm.isEmpty) {
            return InitialLayout();
          }
          if (value.searchResults.isEmpty) {
            return InvitationToAddWord();
          }
          return WordList(wordList: value.searchResults);
        },
      ),
    );
  }
}

class InitialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class InvitationToAddWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
              'Would you mind taking the time to research this word and add it to the dictionary?'),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Add word'),
            onPressed: () {
              _navigateToAddWord(context);
            },
          )
        ],
      ),
    );
  }
}

class WordList extends StatelessWidget {
  const WordList({Key key, this.wordList}) : super(key: key);
  final List<String> wordList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wordList.length,
      itemBuilder: (context, index) {
        final word = wordList[index];
        return ListTile(
          title: Text(word),
          onTap: () {
            _navigateToEnglishDefinition(context, word);
          },
        );
      },
    );
  }
}

void _navigateToAddWord(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddWordPage()),
  );
}

void _navigateToEnglishDefinition(BuildContext context, String word) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EnglishDefinition(word: word)),
  );
}
