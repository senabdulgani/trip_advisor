import 'package:flutter/material.dart';

class LatestLocation extends ChangeNotifier {
  
  String _latestToLocation = 'İstanbul/Türkiye';
  String _latestFromLocation = 'Ankara/Türkiye';

  String get latestToLocation => _latestToLocation;
  String get latestFromLocation => _latestFromLocation;

  void setLatestFromLocation(String location) {
    _latestToLocation = location;
    notifyListeners();
  }

  void setLatestToLocation(String location) {
    _latestFromLocation = location;
    notifyListeners();
  }
}