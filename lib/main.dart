import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants_finals.dart';
import 'features/agenda/presentation/cubit/agenda_cubit.dart';
import 'features/agenda/presentation/cubit/detail_agenda_cubit.dart';
import 'features/layanan_cuti/bloc/layanan_cuti_bloc.dart';
import 'features/layanan_cuti/bloc/other_cuti_bloc.dart';
import 'features/monitoring/bloc/detail_monitoring_bloc.dart';
import 'features/monitoring/bloc/monitoring_bloc.dart';
import 'home_page.dart';
import 'injection_container.dart';

void main() {
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
        BlocProvider(create: (context) => LayananCutiBloc()),
        BlocProvider(create: (context) => OtherCutiBloc()),
        BlocProvider(create: (context) => MonitoringBloc()),
        BlocProvider(create: (context) => DetailMonitoringBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'ADISTY',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
