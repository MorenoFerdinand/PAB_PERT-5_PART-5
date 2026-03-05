import 'package:uuid/uuid.dart';

class Registrant {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String programStudi;
  final DateTime dateOfBirth;
  final String bio;

  Registrant({
    String? id,
    required this.name,
    required this.email,
    required this.gender,
    required this.programStudi,
    required this.dateOfBirth,
    required this.bio,
    // Gunakan Uuid().v4() TANPA kata 'const'
  }) : id = id ?? Uuid().v4(); 

  // Helper untuk hitung umur
  int get age {
    return DateTime.now().year - dateOfBirth.year;
  }
}