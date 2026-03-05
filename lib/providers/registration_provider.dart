import 'package:flutter/material.dart';
import '../models/registrant_model.dart';

class RegistrationProvider extends ChangeNotifier {
  final List<Registrant> _registrants = [];
  String _searchQuery = '';

  List<Registrant> get registrants {
    return _registrants.where((r) => 
      r.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
      r.programStudi.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  void setSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addRegistrant(Registrant data) {
    _registrants.add(data);
    notifyListeners();
  }

  void updateRegistrant(Registrant newData) {
    final index = _registrants.indexWhere((r) => r.id == newData.id);
    if (index != -1) {
      _registrants[index] = newData;
      notifyListeners();
    }
  }

  void deleteRegistrant(String id) {
    _registrants.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}