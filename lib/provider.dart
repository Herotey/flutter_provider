import 'package:development/main.dart';
import 'package:flutter/material.dart';
 //generate list item for testing
final List<Icones> icones = List.generate(
    20, (index) => Icones(title: 'Home $index', subtitle: 'subtitel $index'));
//class provider
class IconProvider with ChangeNotifier {
  final List<Icones> _icones = icones;
  List<Icones> get icons => _icones;
  final List<Icones> _mylist = [];
  List<Icones> get mylist => _mylist;
// method add item to list
  void addToList(Icones icons) {
    _mylist.add(icons);
    notifyListeners();
  }
// method remove item form list
  void removeFromList(Icones icons) {
    _mylist.remove(icons);
    notifyListeners();
  }
}
