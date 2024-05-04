import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants_finals.dart';
import '../../../presensi/presentation/cubit/presensi_cubit.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../widgets/item_adisty_services.dart';
import '../widgets/presensi.dart';
import '../widgets/profile.dart';
import '../widgets/to_agenda.dart';
import '../widgets/to_notification.dart';
import '../widgets/today_presensi_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocListener<PresensiCubit, PresensiState>(
      bloc: context.read<PresensiCubit>(),
      listener: (context, state) {
        print(state);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile and Notification
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile
                        Profile(),

                        // Notification
                        ToNotification(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Presensi and Agenda
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: SizedBox(
                      height: 335,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                // Presensi
                                Presensi(),

                                SizedBox(height: 12),

                                // Agenda
                                ToAgenda(),
                              ],
                            ),
                          ),

                          SizedBox(width: 12),

                          // Today Presensi
                          TodayPresensiSection(),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Container(
                    height: 8,
                    color: const Color(0xFFF6F7F9),
                  ),
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Text(
                      'Layanan Adisty',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: profileCubit.getProfile,
                    child: const Text('Klik Di sini'),
                  ),
                  const ItemAdistyService(
                    img: 'assets/images/shift-bulan.png',
                    title: 'Jadwal Shift',
                    subtitle: 'Tinjau jadwal shift tenaga pendidikan.',
                    path: shiftRoute,
                  ),
                  const SizedBox(height: 16),
                  const ItemAdistyService(
                    img: 'assets/images/agenda.png',
                    title: 'Agenda',
                    subtitle: 'Tinjau setiap agenda yang anda ikuti.',
                    path: agendaRoute,
                  ),
                  const SizedBox(height: 16),
                  const ItemAdistyService(
                    img: 'assets/images/tunjangan-beras.png',
                    title: 'Tunjangan beras',
                    subtitle: 'Tinjau tunjangan beras bulanan anda.',
                    path: tunjanganRoute,
                  ),
                  const SizedBox(height: 16),
                  const ItemAdistyService(
                    img: 'assets/images/layanan-cuti.png',
                    title: 'Layanan Cuti',
                    subtitle: 'Tinjau jatah layanan cuti anda.',
                    path: layananCutiRoute,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
