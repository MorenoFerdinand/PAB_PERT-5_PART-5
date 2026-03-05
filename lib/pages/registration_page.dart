import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/registrant_model.dart';
import '../providers/registration_provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  
  String _gender = 'Laki-laki';
  String _prodi = 'Informatika';
  String? _editingId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is Registrant && _editingId == null) {
      _editingId = args.id;
      _nameCtrl.text = args.name;
      _emailCtrl.text = args.email;
      _bioCtrl.text = args.bio;
      _gender = args.gender;
      _prodi = args.programStudi;
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final data = Registrant(
        id: _editingId,
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        gender: _gender,
        programStudi: _prodi,
        dateOfBirth: DateTime(2000),
        bio: _bioCtrl.text,
      );

      final prov = context.read<RegistrationProvider>();
      if (_editingId != null) {
        prov.updateRegistrant(data);
      } else {
        prov.addRegistrant(data);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_editingId == null ? "Registrasi Baru" : "Edit Peserta")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(controller: _nameCtrl, decoration: const InputDecoration(labelText: "Nama")),
            TextFormField(controller: _emailCtrl, decoration: const InputDecoration(labelText: "Email")),
            DropdownButtonFormField(
              value: _prodi,
              items: ['Informatika', 'Sistem Informasi', 'DKV'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _prodi = v!),
              decoration: const InputDecoration(labelText: "Program Studi"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _save, child: const Text("SIMPAN DATA")),
          ],
        ),
      ),
    );
  }
}