import 'dart:async';
import 'package:flutter/material.dart';
import 'Interface/Post.dart';
import 'Data/fetchPost.dart';

// richiamo fetchPost è quello che mi ritorna lo assegno alla varibile post
void main() => runApp(MyApp(post: fetchPost()));

class MyApp extends StatelessWidget {
  final Future<Post> post;

  // constructor MyApp
  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.body);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // loader in attesa che la varibile snapshot venga riempita
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}