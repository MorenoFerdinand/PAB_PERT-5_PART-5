import 'package:flutter/material.dart';
import '../models/registrant_model.dart';

class RegistrantDetailPage extends StatelessWidget {
  const RegistrantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registrant = ModalRoute.of(context)!.settings.arguments as Registrant;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Peserta")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(radius: 50, child: Text(registrant.name[0], style: const TextStyle(fontSize: 40)))),
            const SizedBox(height: 20),
            _infoRow("Nama", registrant.name),
            _infoRow("Email", registrant.email),
            _infoRow("Gender", registrant.gender),
            _infoRow("Prodi", registrant.programStudi),
            _infoRow("Umur", "${registrant.age} Tahun"),
            const Divider(),
            const Text("Bio:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(registrant.bio),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [SizedBox(width: 80, child: Text("$label:")), Text(value, style: const TextStyle(fontWeight: FontWeight.bold))]),
    );
  }
}