import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants_finals.dart';
import 'core/routes.dart';
import 'features/agenda/presentation/cubit/agenda_cubit.dart';
import 'features/agenda/presentation/cubit/detail_agenda_cubit.dart';
import 'features/gaji/presentation/cubit/detail_gaji_cubit.dart';
import 'features/gaji/presentation/cubit/gaji_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/cuti_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/tambah_sunting_cuti_cubit.dart';
import 'features/monitoring/presentation/cubit/detail_monitoring_cubit.dart';
import 'features/monitoring/presentation/cubit/monitoring_cubit.dart';
import 'features/shift/presentation/cubit/shift_cubit.dart';
import 'features/tunjangan/presentation/cubit/detail_tunjangan_cubit.dart';
import 'features/tunjangan/presentation/cubit/tunjangan_cubit.dart';
import 'helper/firebase_options.dart';
import 'helper/firebase_remote_config_services.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
