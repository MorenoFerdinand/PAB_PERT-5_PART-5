import 'package:flutter/foundation.dart';
import '../models/registrant_model.dart';

class RegistrationProvider extends ChangeNotifier {
  final List<Registrant> _registrants = [];
  String _searchQuery = '';

  List<Registrant> get registrants {
    if (_searchQuery.isEmpty) {
      return List.unmodifiable(_registrants);
    }
    return _registrants.where((r) => 
      r.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
      r.programStudi.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  int get count => registrants.length;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addRegistrant(Registrant registrant) {
    _registrants.add(registrant);
    notifyListeners();
  }

  void updateRegistrant(Registrant updatedData) {
    final index = _registrants.indexWhere((r) => r.id == updatedData.id);
    if (index != -1) {
      _registrants[index] = updatedData;
      notifyListeners();
    }
  }

  void removeRegistrant(String id) {
    _registrants.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  Registrant? getById(String id) {
    try {
      return _registrants.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  bool isEmailRegistered(String email, {String? excludeId}) {
    return _registrants.any(
      (r) => r.email.toLowerCase() == email.toLowerCase() && r.id != excludeId,
    );
  }
}