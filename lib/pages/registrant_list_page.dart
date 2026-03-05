import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/registration_provider.dart';

class RegistrantListPage extends StatelessWidget {
  const RegistrantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<RegistrationProvider>();
    final list = prov.registrants;

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Peserta")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (v) => prov.setSearch(v),
              decoration: const InputDecoration(hintText: "Cari...", prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, i) {
                final r = list[i];
                return Dismissible(
                  key: Key(r.id),
                  background: Container(color: Colors.red, alignment: Alignment.centerRight, child: const Icon(Icons.delete, color: Colors.white)),
                  onDismissed: (_) => prov.deleteRegistrant(r.id),
                  child: ListTile(
                    title: Text(r.name),
                    subtitle: Text(r.programStudi),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => Navigator.pushNamed(context, '/', arguments: r),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}