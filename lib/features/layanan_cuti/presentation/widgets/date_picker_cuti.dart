import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';

class DatePickerCuti extends StatelessWidget {
  final String pesan;
  final bool isMulai;
  const DatePickerCuti({
    super.key,
    required this.pesan,
    this.isMulai = true,
  });

  @override
  Widget build(BuildContext context) {
    final TambahSuntingCutiCubit tambahSuntingCutiCubit =
        context.read<TambahSuntingCutiCubit>();
    return InkWell(
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          if (isMulai) {
            tambahSuntingCutiCubit.ubahTanggalMulai(date);
          } else {
            tambahSuntingCutiCubit.ubahTanggalSelesai(date);
          }
        }
      },
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/pilih-tanggal.svg'),
          SizedBox(
            width: Screen.kSize12,
          ),
          Expanded(
            child: Text(
              pesan,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral90,
                fontSize: Screen.kSize16,
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/arrow-right.svg'),
        ],
      ),
    );
  }
}
