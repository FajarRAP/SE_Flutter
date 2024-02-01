import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';
import 'agenda/bloc/agenda_bloc.dart';
import 'agenda/bloc/detail_agenda_bloc.dart';
import 'layanan_cuti/bloc/layanan_cuti_bloc.dart';
import 'layanan_cuti/bloc/other_cuti_bloc.dart';
import 'monitoring/bloc/monitoring_bloc.dart';
import 'monitoring/bloc/detail_monitoring_bloc.dart';
import 'helper/app_styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AgendaBloc>(create: (context) => AgendaBloc()),
        BlocProvider<DetailAgendaBloc>(create: (context) => DetailAgendaBloc()),
        BlocProvider<LayananCutiBloc>(create: (context) => LayananCutiBloc()),
        BlocProvider<OtherCutiBloc>(create: (context) => OtherCutiBloc()),
        BlocProvider<MonitoringBloc>(create: (context) => MonitoringBloc()),
        BlocProvider<DetailMonitoringBloc>(
            create: (context) => DetailMonitoringBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
