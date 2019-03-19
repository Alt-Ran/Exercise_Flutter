import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// Questo widget essendo esteso a stateLess sarà un widget fisso
class MyApp extends StatelessWidget {
  // primo metodo chiamato che richiama a sua volta RandomWords()
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name',
      home: RandomWords(),
    );
  }
}

// essendo che la classe che richiama questa e un Widget dinamico
// lo estendo con State cosi se il Widget cambia attraverso lo State viene
// ricreato questo Widget.
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        //padding della cella
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {

          //debugPrint() --> per stampare in console [importare questo package per ciò che funzioni 'package:flutter/foundation.dart']

          // se la i è dispari disegna una riga divisoria
          if (i.isOdd) {
            return Divider();
          }

          // con ~ ritorna un numero intero. Di default lavora con dei double
          final index = i ~/ 2;

          //se l'index diventa maggiore della linghezza dell'array aggiunge altri 10 elementi
          if (index >= _suggestions.length) {
            //aggiunge all'array 10 parole [generateWordPairs funzione del package aggiunto 'english_words']
            _suggestions.addAll(generateWordPairs().take(10));
          }

          //ritorna a _buildRos quello che c'è nell'array in ordine crescente
          return _buildRow(_suggestions[index]);
        });
  }

  // crea la singola cella
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,      //assegna il testo che gli arriva da _buildSuggestions
        style: _biggerFont,     //assegna un font size salvato nella variabile _biggerFont
      ),
    );
  }

  // Viene richiamato automaticamento quando viene chiamata la classe
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name'),
      ),
      body: _buildSuggestions(),
    );
  }
}

// classe richiamata dal widget build della classe MyApp
// e lo estendo rendendolo un widget dinamico [StateFul]
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}