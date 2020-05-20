import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  User();

  int id;
  int _reliabilityScore = 0;
  bool _checkBoxValue = true;
  bool _hasClicked = false;
  bool _detectText = false;

  int get reliabilityScore => _reliabilityScore;
  bool get hasClicked => _hasClicked;
  bool get detectText => _detectText;
  bool get checkBoxValue => _checkBoxValue;

  void setReliabilityScore(int value) {
    _reliabilityScore = _reliabilityScore + value;
    notifyListeners();
  }

  void setCheckBoxValue(bool value) {
    _checkBoxValue = value;
    notifyListeners();
  }

  void setDetectTextValue(bool value) {
    _detectText = value;
    notifyListeners();
  }

  void setHasClicked(bool value) {
    _hasClicked = value;
    notifyListeners();
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;
}
