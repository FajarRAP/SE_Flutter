import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

import '../../../presensi/presentation/cubit/presensi_cubit.dart';

class Presensi extends StatelessWidget {
  const Presensi({super.key});

  @override
  Widget build(BuildContext context) {
    final presensiCubit = context.read<PresensiCubit>();
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, rekapBulananRoute),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Color(0xFFD5ECFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Presensi',
                style: Styles.kPoppinsBold.copyWith(
                  color: kBlack,
                  fontSize: 18,
                ),
              ),
              BlocBuilder<PresensiCubit, PresensiState>(
                bloc: presensiCubit..getRekapPresensi(),
                buildWhen: (previous, current) => current is RekapPresensi,
                builder: (context, state) {
                  if (state is RekapPresensiLoaded) {
                    return Text(
                      state.data.jumlahHari,
                      style: Styles.kPoppinsBold.copyWith(
                        color: kBlack,
                        fontSize: 40,
                      ),
                    );
                  }
                  return const CircularProgressIndicator(color: kBlack);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bulan ini',
                    style: Styles.kNunitoBold.copyWith(
                      color: kBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
