import 'package:flutter/material.dart';
import 'package:konsumsi_api_agenda/shift/pages/jadwal_shift.dart';

import 'agenda/pages/agenda_page.dart';
import 'gaji/pages/informasi_gaji.dart';
import 'tunjangan/pages/tunjangan_beras.dart';
import 'layanan_cuti/pages/layanan_cuti.dart';
import 'monitoring/pages/monitoring_page.dart';

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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TunjanganBeras()),
              ),
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
                MaterialPageRoute(builder: (context) => InformasiGaji()),
              ),
              child: const Text("Gaji"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const JadwalShift()),
              ),
              child: const Text("Shift"),
            ),
            ElevatedButton(
              onPressed: () => MaterialPageRoute(
                  builder: (context) => const LayananCutiPage()),
              child: const Text("Layanan Cuti"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MonitoringPage()),
              ),
              child: const Text("Monitoring"),
            ),
          ],
        ),
      ),
    );
  }
}
