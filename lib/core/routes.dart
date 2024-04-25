import 'package:flutter/material.dart';

import '../features/agenda/presentation/pages/agenda.dart';
import '../features/agenda/presentation/pages/detail_agenda.dart';
import '../features/auth/presentation/pages/change_password.dart';
import '../features/auth/presentation/pages/forgot_password.dart';
import '../features/auth/presentation/pages/login.dart';
import '../features/auth/presentation/pages/otp_verfication.dart';
import '../features/gaji/presentation/pages/detail_gaji.dart';
import '../features/gaji/presentation/pages/gaji.dart';
import '../features/layanan_cuti/presentation/pages/layanan_cuti.dart';
import '../features/layanan_cuti/presentation/pages/sunting_cuti.dart';
import '../features/layanan_cuti/presentation/pages/tambah_cuti.dart';
import '../features/monitoring/presentation/pages/detail_monitoring.dart';
import '../features/monitoring/presentation/pages/monitoring.dart';
import '../features/shift/presentation/pages/jadwal_shift.dart';
import '../features/tunjangan/presentation/pages/detail_tunjangan_beras.dart';
import '../features/tunjangan/presentation/pages/tunjangan.dart';
import '../home_page.dart';
import '../init_screens/fragment_view.dart';
import '../init_screens/splash.dart';
import 'constants_finals.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    splashRoute:(context) => const SplashScreen(),
    homeRoute: (context) => const HomePage(),
    loginRoute: (context) => const LoginPage(),
    forgotPasswordRoute: (context) => const ForgotPasswordPage(),
    otpVerificationRoute:(context) => const OTPVerificationPage(),
    changeNewPasswordRoute: (context) => const ChangeNewPassword(),
    fragmentViewRoute:(context) => const FragmentView(),
    agendaRoute: (context) => const AgendaPage(),
    agendaDetailRoute: (context) => const DetailAgendaPage(),
    layananCutiRoute: (context) => const LayananCutiPage(),
    layananCutiSuntingRoute: (context) => const SuntingCutiPage(),
    layananCutiTambahRoute: (context) => const TambahCutiPage(),
    monitoringRoute: (context) => const MonitoringPage(),
    monitoringDetailRoute: (context) => const DetailMonitoringPage(),
    gajiRoute: (context) => const GajiPage(),
    gajiDetailRoute: (context) => const DetailGajiPage(),
    shiftRoute: (context) => const JadwalShiftPage(),
    tunjanganRoute: (context) => const TunjanganBerasPage(),
    tunjanganDetailRoute: (context) => const DetailTunjanganBerasPage(),
  };
}
