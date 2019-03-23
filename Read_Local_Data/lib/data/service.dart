import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
// richiamo l'interfaccia
import 'package:esercizi/interface/shopping_interface.dart';

shopping crossword;

Future<String> _loadCrosswordAsset() async {
  return await rootBundle.loadString('assets/data/List.json');
}

shopping _parseJsonForCrossword(String jsonString) {
  Map decoded = jsonDecode(jsonString);

  List<Word> words = new List<Word>();
  List<Crossword> items = new List<Crossword>();


  for (var item in decoded['shopping_list']) {
    for (var word in item['across']) {
      words.add(new Word(word['number'], word['word']));
    }

    items.add(new Crossword(item['name'], new Across(words)));
  }

  return new shopping(items);
}

Future loadCrossword() async {
  String jsonCrossword = await _loadCrosswordAsset();
  crossword = _parseJsonForCrossword(jsonCrossword);
}

shopping getJson(){
  return crossword;
}