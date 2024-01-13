import 'package:flutter/material.dart';
import 'agenda/agenda_page.dart';
import 'tunjangan/tunjangan_beras.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              // Impelement to Tunjangan Page
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => TunjanganBeras(),
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
