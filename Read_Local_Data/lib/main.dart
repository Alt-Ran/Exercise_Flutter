import 'package:flutter/material.dart';
import 'data/service.dart';
import 'package:esercizi/interface/shopping_interface.dart';

void main() async{
  await loadCrossword();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  shopping shoppingList =  getJson();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: new Center(
              child:  Text(shoppingList.item[1].name),
        ),
        ),
      ),
    );
  }
}