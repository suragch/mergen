import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mergen/pages/search/found_words_notifier.dart';
import 'package:mergen/services/dictionary.dart';
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

//final value = ValueNotifier(0);
class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final myValue = FakeDictionary();
    return Column(
      children: [
        Padding(
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
        ),
        Expanded(
          child: 
          ValueListenableBuilder(
            valueListenable: locator<FoundWordsNotifier>(),
            builder: (context, value, child) => ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value[index]),
                  onTap: () {
                    
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
