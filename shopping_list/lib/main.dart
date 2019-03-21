import 'package:flutter/material.dart';
import 'addItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: shoppingList(),
    );
  }
}

class shoppingListState extends State<shoppingList> {
  var title;
  final List<String> _myList = new List();
  final _itemDress = ['prova', 'test', 'ok', 'fuck'];
  final _itemFods = ['prova', 'test', 'ok', 'fuck'];
  final Set _saved = new Set();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildList(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _itemDress.length*2,
        itemBuilder: (context, i) {

          if (i.isOdd) {
            return Divider();
          }

          final index = i ~/ 2;

          return _buildRow(_itemDress[index]);
        });
  }

  Widget _buildRow(item){
    final bool alreadyCheck = _saved.contains(item);

    return ListTile(
      title: Text(
        item,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadyCheck ? Icons.check_box_outline_blank : Icons.check_box,
        color: alreadyCheck ? Colors.grey :  Colors.green ,
      ),
        onTap: () {
          setState(() {
            if (alreadyCheck) {
              //rimuovo dall'array la parola cliccata
              _saved.remove(item);
            } else {
              //aggiungo nell'array la parola cliccata
              _saved.add(item);
            }
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addItem()),
                );
              },
          ),
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget> [
              new ListTile(
                title: new Text('Menu Shopping List',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    )
                ),
              ),
              new ListTile(
                title: new Text('Dress List'),
                onTap: () {
                  title = "Dress List";
                },
              ),
              new Divider(
                indent: 16.0,
                color: Colors.grey,
              ),
              new ListTile(
                title: new Text('Fods list'),
                onTap: () {
                  title = "Fods list";
                },
              ),
            ],
          )
      ),
      body: Center(

      ),
    );
  }
}

class shoppingList extends StatefulWidget {
  @override
  shoppingListState createState() => new shoppingListState();
}