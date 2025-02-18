import 'package:flutter/material.dart';

class ShopViewModel extends ChangeNotifier {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 1;

  final List<Color> _colors = [Colors.blue, Colors.yellow, Colors.green, Colors.pink];
  final List<String> _sizes = ["7", "8", "9", "10", "11"];

  // Getters
  int get selectedColorIndex => _selectedColorIndex;
  int get selectedSizeIndex => _selectedSizeIndex;
  List<Color> get colors => _colors;
  List<String> get sizes => _sizes;

  // Set selected color
  void setSelectedColor(int index) {
    _selectedColorIndex = index;
    notifyListeners();
  }

  // Set selected size
  void setSelectedSize(int index) {
    _selectedSizeIndex = index;
    notifyListeners();
  }
}
