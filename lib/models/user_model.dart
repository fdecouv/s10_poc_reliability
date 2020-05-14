import 'package:flutter/material.dart';

class User extends ChangeNotifier{
  User();

  int id;
  int _reliabilityScore = 0;
  bool boolValue = true;

  int get reliabilityScore => _reliabilityScore;

  void setReliabilityScore(int value){
    _reliabilityScore =  _reliabilityScore + value;
    notifyListeners();
  }

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is User && other.id == id;
}