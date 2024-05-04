import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/presensi_cubit.dart';
import '../widgets/item_detail_today_presensi.dart';

class DetailTodayPresensiPage extends StatelessWidget {
  const DetailTodayPresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final presensiCubit = context.read<PresensiCubit>();
    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kWhite,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              title: Text(
                'Presensi Tendik',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: const BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: boxShadow,
                  color: kWhite,
                ),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  children: [
                    ItemDetailTodayPresensi(
                      path: 'tanggal',
                      title: 'Tanggal',
                      subtitle: presensiCubit.getTanggal,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    ItemDetailTodayPresensi(
                        path: 'status',
                        title: 'Status Presensi',
                        subtitle: presensiCubit.getStatus),
                    const Divider(),
                    const SizedBox(height: 16),
                    ItemDetailTodayPresensi(
                      path: 'lokasi',
                      title: 'Lokasi',
                      subtitle: presensiCubit.getLokasi,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    ItemDetailTodayPresensi(
                      path: 'biaya-perjalanan',
                      title: 'Insentif',
                      subtitle: presensiCubit.getInsentif,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    ItemDetailTodayPresensi(
                      path: 'masuk',
                      title: 'Jam Masuk',
                      subtitle: presensiCubit.getJamMasuk,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    ItemDetailTodayPresensi(
                      path: 'pulang',
                      title: 'Jam Pulang',
                      subtitle: presensiCubit.getJamPulang,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

