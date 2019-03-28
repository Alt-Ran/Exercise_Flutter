import 'package:flutter/material.dart';
import 'data/service.dart';
import 'Page/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(post: loadCrossword()),
    );
  }
}