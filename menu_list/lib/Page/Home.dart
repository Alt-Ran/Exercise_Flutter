import 'package:flutter/material.dart';
import 'package:esercizi/interface/shopping_interface.dart';
import 'addList.dart';

class Home extends StatefulWidget {
  final Future<shopping> post;

  // constructor MyApp
  Home({Key key, this.post}) : super(key: key);

  @override
  shoppingListState createState() => new shoppingListState();
}


class shoppingListState extends State<Home> {
  int _selectedDrawerIndex;


  _onSelectItem(int Index) {
    _selectedDrawerIndex = Index;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context){
    var drawerOptions = <Widget>[];

    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping List"),
        ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget> [
              new ListTile(
                title: new Text('Menu Lists',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                    )
                ),
              ),
              new Column(
                children: <Widget>[
                  FutureBuilder<shopping>(
                  future: widget.post,
                  builder: (context, snapshot) {
                    List<Widget> list = new List<Widget>();

                    if(snapshot.hasData){
                      for(int i=0; i<=2; i++){
                        list.add(
                          ListTile(
                            title: new Text(snapshot.data.item[i].name),
                            selected: i == _selectedDrawerIndex,
                            onTap: () => _onSelectItem(i),
                          )
                        );
                      }
                      return new Column(children: list);
                    }else if (snapshot.hasError) {
                      return Text("Error, try again");
                    }

                    return Text("Loading");
                  },
                  ),
                ]
              ),
              new Column(children: drawerOptions),
              new Divider(
                indent: 16.0,
                color: Colors.grey,
              ),
              new ListTile(
                leading: new IconButton(
                  icon: const Icon(Icons.add),
                ),
                title: new Text('Add new shopping list'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addList()),
                  );
                },
              ),
            ],
          ),
      ),
        body: null,
    );
  }
}

