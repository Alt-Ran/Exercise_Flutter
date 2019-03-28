import 'package:flutter/material.dart';
import '../data/service.dart';

class addList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add new List',
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Add New List'),
        ),
        body: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Form(
                key: null,
                child: new ListView(
                  children: <Widget>[
                    new TextFormField(
                        keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'ex. food list',
                            labelText: 'New List'
                        )
                    ),
                    new Container(
                      width: null,
                      child: new RaisedButton(
                        child: new Text(
                          'Save',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () => null,
                        color: Colors.blue,
                      ),
                      margin: new EdgeInsets.only(
                          top: 20.0
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
    );
  }
}