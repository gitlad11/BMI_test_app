import 'package:flutter/cupertino.dart';

class Pages_store with ChangeNotifier  {
  int _current = 0;

  set_data(int current){
    _current = current;
    notifyListeners();
  }

  int get current => _current;
}