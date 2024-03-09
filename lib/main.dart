import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants_finals.dart';
import 'core/routes.dart';
import 'features/agenda/presentation/cubit/agenda_cubit.dart';
import 'features/agenda/presentation/cubit/detail_agenda_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/cuti_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/tambah_sunting_cuti_cubit.dart';
import 'features/monitoring/presentation/cubit/detail_monitoring_cubit.dart';
import 'features/monitoring/presentation/cubit/monitoring_cubit.dart';
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        initialRoute: homeRoute,
        routes: Routes.routes,
      ),
    );
  }
}
