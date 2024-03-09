import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/cuti.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';

class ItemCuti extends StatelessWidget {
  final DataCutiModel dataCutiModel;
  const ItemCuti({
    super.key,
    required this.dataCutiModel,
  });

  @override
  Widget build(BuildContext context) {
    final TambahSuntingCutiCubit tambahSuntingCutiCubit =
        context.read<TambahSuntingCutiCubit>();

    return Container(
      decoration: ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Screen.kSize12,
          ),
        ),
        shadows: boxShadow,
      ),
      width: Screen.width,
      height: Screen.width * .25,
      padding: EdgeInsets.all(
        Screen.kSize12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiModel.keterangan,
                style: Styles.kPoppinsMedium,
              ),
              Material(
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    tambahSuntingCutiCubit.dataCutiModel = dataCutiModel;
                    Navigator.of(context).pushNamed(layananCutiSuntingRoute);
                  },
                  child: SvgPicture.asset(
                    penEditSvg,
                    width: Screen.kSize24,
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Cuti',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: Screen.kSize14,
                ),
              ),
              Text(
                'Selesai Cuti',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: Screen.kSize14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiModel.tanggalMulai,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: Screen.kSize14,
                ),
              ),
              Text(
                dataCutiModel.tanggalSelesai,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: Screen.kSize14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
