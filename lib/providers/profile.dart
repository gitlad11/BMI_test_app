import 'package:flutter/cupertino.dart';

class Profile_store with ChangeNotifier  {
  Map _profile = { 'avatar' : 'images/mes.jpg' };

  set_data(Map data){
    _profile = data;
    notifyListeners();
  }

  Map get profile => _profile;
}