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
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

// essendo che la classe che richiama questa e un Widget dinamico
// lo estendo con State cosi se il Widget cambia attraverso lo State viene
// ricreato questo Widget.
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
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
    //mi restituisce true o false in base a se nell'array _save esiste o meno pair
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,      //assegna il testo che gli arriva da _buildSuggestions
        style: _biggerFont,     //assegna un font size salvato nella variabile _biggerFont
      ),
      trailing: new Icon(
        // se already saved è true disegna il cuore pieno senò solo il contrno
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            //rimuovo dall'array la parola cliccata
            _saved.remove(pair);
          } else {
            //aggiungo nell'array la parola cliccata
            _saved.add(pair);
          }
        });
      },
    );
  }

  // alla pressione sull'icona richiamo questo metodo
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(   // Creo una nuova pagina
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
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
            tiles: tiles,
          )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      )
    );
  }

  // Viene richiamato automaticamento quando viene chiamata la classe
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name'),
        actions: <Widget>[      //aggiungo l'icona per cambiare pagina
          new IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved),
        ],
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
