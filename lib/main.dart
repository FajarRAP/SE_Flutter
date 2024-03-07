import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants_finals.dart';
import 'features/agenda/presentation/cubit/agenda_cubit.dart';
import 'features/agenda/presentation/cubit/detail_agenda_cubit.dart';
import 'features/agenda/presentation/pages/agenda.dart';
import 'features/agenda/presentation/pages/detail_agenda.dart';
import 'features/layanan_cuti/bloc/other_cuti_bloc.dart';
import 'features/layanan_cuti/presentation/cubit/cuti_cubit.dart';
import 'features/layanan_cuti/presentation/cubit/tambah_sunting_cuti_cubit.dart';
import 'features/layanan_cuti/presentation/pages/layanan_cuti.dart';
import 'features/layanan_cuti/presentation/pages/sunting_cuti_page.dart';
import 'features/layanan_cuti/presentation/pages/tambah_cuti_page.dart';
import 'features/monitoring/bloc/detail_monitoring_bloc.dart';
import 'features/monitoring/bloc/monitoring_bloc.dart';
import 'home_page.dart';
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
        BlocProvider(create: (context) => OtherCutiBloc()),
        BlocProvider(create: (context) => MonitoringBloc()),
        BlocProvider(create: (context) => DetailMonitoringBloc()),
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
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/agenda': (context) => const AgendaPage(),
          '/agenda/detail': (context) => const DetailAgendaPage(),
          '/layananCuti': (context) => const LayananCutiPage(),
          '/layananCuti/sunting': (context) => const SuntingCutiPage(),
          '/layananCuti/tambah': (context) => const TambahCutiPage(),
        },
      ),
    );
  }
}
