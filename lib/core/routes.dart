import 'package:flutter/material.dart';
import '../features/agenda/presentation/pages/agenda.dart';
import '../features/agenda/presentation/pages/detail_agenda.dart';
import '../features/layanan_cuti/presentation/pages/layanan_cuti.dart';
import '../features/layanan_cuti/presentation/pages/sunting_cuti.dart';
import '../features/layanan_cuti/presentation/pages/tambah_cuti.dart';
import '../features/monitoring/presentation/pages/detail_monitoring.dart';
import '../features/monitoring/presentation/pages/monitoring.dart';
import '../home_page.dart';
import 'constants_finals.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    homeRoute: (context) => const HomePage(),
    agendaRoute: (context) => const AgendaPage(),
    agendaDetailRoute: (context) => const DetailAgendaPage(),
    layananCutiRoute: (context) => const LayananCutiPage(),
    layananCutiSuntingRoute: (context) => const SuntingCutiPage(),
    layananCutiTambahRoute: (context) => const TambahCutiPage(),
    monitoringRoute: (context) => const MonitoringPage(),
    monitoringDetailRoute: (context) => const DetailMonitoringPage(),
  };
}
