import 'package:flutter/material.dart';

import 'agenda/pages/agenda_page.dart';
import 'gaji/pages/informasi_gaji.dart';
import 'layanan_cuti/pages/layanan_cuti.dart';
import 'monitoring/pages/monitoring_page.dart';
import 'shift/pages/jadwal_shift.dart';
import 'tunjangan/pages/tunjangan_beras.dart';

import 'helper/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigateTo(namaPage: 'Tunjangan', page: TunjanganBeras()),
            NavigateTo(namaPage: 'Agenda', page: AgendaPage()),
            NavigateTo(namaPage: 'Layanan Cuti', page: LayananCutiPage()),
            NavigateTo(namaPage: 'Monitoring', page: MonitoringPage()),
            NavigateTo(namaPage: 'Gaji', page: InformasiGaji()),
            NavigateTo(namaPage: 'Shift', page: JadwalShift()),
          ],
        ),
      ),
    );
  }
}

class NavigateTo extends StatelessWidget {
  final String namaPage;
  final Widget page;
  const NavigateTo({
    super.key,
    required this.namaPage,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: BoxConstraints(
        minWidth: SizeConfig.screenWidth! * .35,
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Text(namaPage),
      ),
    );
  }
}
