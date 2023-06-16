import 'package:flutter/cupertino.dart';

class Numbers_store with ChangeNotifier  {
  List _numbers = [
    { 'country' : 'United states', 'items' : ['+87008673925', '+87008673925', '+87008673925'] },
    { 'country' : 'United kingdom', 'items' : ['+87008673925', '+87008673925', '+87008673925'] },
  ];


  set_data(List data){
    _numbers = data;
    notifyListeners();
  }

  List get numbers => _numbers;
}