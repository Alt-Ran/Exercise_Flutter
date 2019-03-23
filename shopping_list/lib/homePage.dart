import 'package:flutter/material.dart';
import 'package:shopping_list/addList.dart';
import 'package:shopping_list/service.dart';


class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class HomePage extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("List 01"),
    new DrawerItem("List 02"),
    new DrawerItem("List 03")
  ];

  @override
  shoppingListState createState() => new shoppingListState();
}


class shoppingListState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  String title = "Shopping list";

  final Set _saved = new Set();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  /*Widget _buildList(){
    for(var i = 0; i < 10; i++){
      debugPrint("$i");

    }
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //itemCount: _myList.length*2,
        itemBuilder: (context, i) {

          debugPrint("$_myList");

          /*if(_selectedDrawerIndex != 1){
            if (i.isOdd) {
              return Divider();
            }

            final index = i ~/ 2;
          */
            return null; //_buildRow(_myList.name[0]);
          }
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
              _saved.remove(item);
            } else {
              _saved.add(item);
            }
          });
        }
    );
  }*/

  _onSelectItem(int index) {
    var d = widget.drawerItems[index];

    _selectedDrawerIndex = index;
    title = d.title;

    //debugPrint("$_myList");

    //setState((){ _buildList();});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {

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
          )
      ),
      body: null //,_buildList(),
    );
  }
}