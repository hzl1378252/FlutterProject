import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordState();
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list),onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
          // 在偶数行，该函数会为单词对添加一个ListTile row.
          // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
          // 注意，在小屏幕上，分割线看起来可能比较吃力。
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
  void _pushSaved(){
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder:(context){
            final title  =_saved.map(
              (pair){
                return ListTile(
                  title: new Text(
                  pair.asPascalCase,
                  style:_biggerFont
                ),
                );
              }
            );
            final divider =ListTile.divideTiles(tiles: title,
            context: context).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text("Saved Suggestions"),
                
              ),
              body: new ListView(children: divider,),
            );
          }
          
        )
      );
  }
}
