import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  int _bottomBarIndex = 0;

  int get bottomBarIndex => _bottomBarIndex;

  bottomOnChanged(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }
}
