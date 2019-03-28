import 'package:flutter/material.dart';
import 'data/service.dart';
import 'package:esercizi/interface/shopping_interface.dart';

// avvio l'app richiamando la classe MyApp e salvo il risultato di
// loadCrossword() nella variabile post
void main() => runApp(MyApp(post: loadCrossword()));

class MyApp extends StatelessWidget {
  final Future<shopping> post;

  // constructor MyApp
  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: FutureBuilder<shopping>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.item[0].name);
              }

              // creo un loader fino a quando post non riceve i dati
              // dal JSON.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}