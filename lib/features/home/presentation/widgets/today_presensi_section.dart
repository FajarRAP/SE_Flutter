import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../../../presensi/presentation/cubit/presensi_cubit.dart';
import 'body_today_presensi.dart';

class TodayPresensiSection extends StatelessWidget {
  const TodayPresensiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final presensiCubit = context.read<PresensiCubit>();
    return Expanded(
      flex: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, detailTodayPresensiRoute),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: kBlue,
          ),
          child: BlocBuilder<PresensiCubit, PresensiState>(
            bloc: presensiCubit..getTodayPresensi(),
            buildWhen: (previous, current) => current is TodayPresensi,
            builder: (context, state) {
              if (state is TodayPresensiLoaded) {
                return BodyTodayPresensi(data: state.data);
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: kWhite,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
