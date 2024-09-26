import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants_finals.dart';
import 'features/agenda/presentation/cubit/agenda_cubit.dart';
import 'features/agenda/presentation/cubit/detail_agenda_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/dashboard/presentation/cubit/detail_presensi_today_cubit.dart';
import 'features/gaji/presentation/cubit/detail_gaji_cubit.dart';
import 'features/gaji/presentation/cubit/gaji_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/cuti_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/tambah_sunting_cuti_cubit.dart';
import 'features/monitoring/presentation/cubit/daftar_presensi_cubit.dart';
import 'features/monitoring/presentation/cubit/detail_monitoring_cubit.dart';
import 'features/monitoring/presentation/cubit/monitoring_cubit.dart';
import 'features/presensi/presentation/cubit/presensi_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/monitoring/presentation/cubit/rekap_bulanan_cubit.dart';
import 'features/presensi/presentation/cubit/shift_berikutnya_cubit.dart';
import 'features/shift/presentation/cubit/shift_cubit.dart';
import 'features/tunjangan/presentation/cubit/detail_tunjangan_cubit.dart';
import 'features/tunjangan/presentation/cubit/tunjangan_cubit.dart';
import 'helper/firebase_options.dart';
import 'helper/firebase_remote_config_services.dart';
import 'injection_container.dart';
import 'core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: 'https://bxknqavpfdqvbznuhpat.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ4a25xYXZwZmRxdmJ6bnVocGF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY4MDMxNjUsImV4cCI6MjA0MjM3OTE2NX0.D6ogGEzUxa5U3h9PltftTDHkbHGxpHc_8AYPjUYnvoU',
  );
  
  await FirebaseRemoteConfigServices().initialize();
  dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AgendaCubit()),
        BlocProvider(create: (context) => DetailAgendaCubit()),
        BlocProvider(create: (context) => CutiCubit()),
        BlocProvider(create: (context) => TambahSuntingCutiCubit()),
        BlocProvider(create: (context) => MonitoringCubit()),
        BlocProvider(create: (context) => DetailMonitoringCubit()),
        BlocProvider(create: (context) => GajiCubit()),
        BlocProvider(create: (context) => DetailGajiCubit()),
        BlocProvider(create: (context) => ShiftCubit()),
        BlocProvider(create: (context) => TunjanganCubit()),
        BlocProvider(create: (context) => DetailTunjanganCubit()),
        BlocProvider(create: (context) => PresensiCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => DetailPresensiTodayCubit()),
        BlocProvider(create: (context) => RekapBulananCubit()),
        BlocProvider(create: (context) => DaftarPresensiCubit()),
        BlocProvider(create: (context) => ShiftBerikutnyaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'ADISTY',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kBlue,
          ),
          useMaterial3: true,
        ),
        initialRoute: splashRoute,
        routes: Routes.routes,
      ),
    );
  }
}
