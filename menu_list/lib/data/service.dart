import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
// richiamo l'interfaccia
import 'package:esercizi/interface/shopping_interface.dart';


Future<String> _loadCrosswordAsset() async {
  return await rootBundle.loadString('assets/data/List.json');
}

shopping _parseJsonForShopping(String jsonString) {
  Map decoded = jsonDecode(jsonString);

  List<Crossword> items = new List<Crossword>();

  for (var item in decoded['shopping_list']) {
    items.add(new Crossword(item['name']));
  }

  return new shopping(items);
}

Future<shopping> loadCrossword() async {
  String jsonCrossword = await _loadCrosswordAsset();
  shopping crossword = _parseJsonForShopping(jsonCrossword);


  return crossword;
}
