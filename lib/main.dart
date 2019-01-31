import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords>{
   final _suggestions = <WordPair>[];
   final _biggerFont = const TextStyle(fontSize: 18);
   final Set<WordPair> _saved = new Set<WordPair>();
   
   @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: Text("this is app bar"),
        actions: <Widget>[
       new IconButton(icon: const Icon(Icons.list),onPressed: _pushSaved),
     ],
     ),
     body: _buildSuggestions(),
   );
  }

  void _pushSaved(){
    Navigator.of(context).push(
       new MaterialPageRoute<void>(
         builder: (BuildContext context){
           final Iterable<ListTile> titles = _saved.map(
             (WordPair pair){
               return new ListTile(
                 title: new Text(
                   pair.asPascalCase,
                   style: _biggerFont,
                 ),
               );
             },
           );
           final List<Widget> divided = ListTile
           .divideTiles(
             context: context,
             tiles: titles,
           ).toList();

           return new Scaffold(
             appBar: new AppBar(
               title: const Text("this is saved Suggestions"),
             ),
             body: new ListView(children: divided),
           );
         },
       ),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
         if(i.isOdd) return Divider();

         final index = i ~/ 2 ;
         if(index >= _suggestions.length){
           _suggestions.addAll(generateWordPairs().take(10));
         }
         return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null
      ),
      onTap: (){
        setState(() {
         if(alreadySaved){
           _saved.remove(pair);
         } else {
           _saved.add(pair);
         }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}