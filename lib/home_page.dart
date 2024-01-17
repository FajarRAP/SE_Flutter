import 'package:flutter/material.dart';

import 'tunjangan/pages/tunjangan_beras.dart';
import 'agenda/pages/agenda_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // Impelement to Tunjangan Page
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TunjanganBeras(),
              )),
              child: const Text("Tunjangan"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AgendaPage()),
              ),
              child: const Text("Agenda"),
            ),
          ],
        ),
      ),
    );
  }
}
