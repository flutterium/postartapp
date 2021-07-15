import 'package:flutter/cupertino.dart';

class SelectedIndex extends ChangeNotifier {
  int? _selectedIndex;
  int? _nextIndex;

  SelectedIndex() {
    _selectedIndex = 0;
    _nextIndex = 0;
  }

  int get selectedIndex => _selectedIndex!;
  int get nextIndex => _nextIndex!;

  incrementIndex() {
    _nextIndex = _nextIndex! + 1;
    notifyListeners();
  }

  changeSelectedIndex(int? i) {
    _selectedIndex = i;

    print('Next index : $_nextIndex\nSelected index : $_selectedIndex');
    notifyListeners();
  }
}
