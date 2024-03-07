import 'package:flutter/material.dart';

import 'core/constants_finals.dart';
import 'features/agenda/presentation/pages/agenda.dart';

import 'features/gaji/pages/informasi_gaji.dart';
import 'features/layanan_cuti/presentation/pages/layanan_cuti.dart';
import 'features/monitoring/pages/monitoring_page.dart';
import 'features/shift/pages/jadwal_shift.dart';
import 'features/tunjangan/pages/tunjangan_beras.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigateTo(namaPage: '/agenda'),
            // NavigateTo(namaPage: 'Tunjangan', page: TunjanganBeras()),
            // NavigateTo(namaPage: 'Agenda', page: AgendaPage()),
            NavigateTo(namaPage: '/layananCuti'),
            // NavigateTo(namaPage: 'Monitoring', page: MonitoringPage()),
            // NavigateTo(namaPage: 'Gaji', page: InformasiGaji()),
            // NavigateTo(namaPage: 'Shift', page: JadwalShift()),
          ],
        ),
      ),
    );
  }
}

class NavigateTo extends StatelessWidget {
  final String namaPage;
  const NavigateTo({
    super.key,
    required this.namaPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: Screen.width * .35,
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(namaPage),
        child: Text(namaPage),
      ),
    );
  }
}
