import 'package:flutter/material.dart';
import 'package:konsumsi_api_agenda/gaji/pages/gaji.dart';
import 'package:konsumsi_api_agenda/shift/pages/jadwal_shift.dart';

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
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const InformasiGaji()),
              ),
              child: const Text("Gaji"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const JadwalShift()),
              ),
              child: const Text("Shift"),
            ),
          ],
        ),
      ),
    );
  }
}
