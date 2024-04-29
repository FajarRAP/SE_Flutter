import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/gaji.dart';
import '../cubit/detail_gaji_cubit.dart';

class ItemGaji extends StatelessWidget {
  final DataGajiModel dataGaji;

  const ItemGaji({
    super.key,
    required this.dataGaji,
  });

  @override
  Widget build(BuildContext context) {
    final DetailGajiCubit detailGajiCubit = context.read<DetailGajiCubit>();

    return InkWell(
      onTap: () {
        detailGajiCubit.setDataGaji = dataGaji;
        Navigator.of(context).pushNamed(gajiDetailRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/gaji.svg',
              width: 40,
            ),

            const SizedBox(width: 16),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataGaji.nominal,
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kBlack,
                    fontSize: 18,
                  ),
                ),
                Text(
                  dataGaji.bulan,
                  style: Styles.kNunitoRegular.copyWith(
                    color: kNeutral90,
                    fontSize: 14,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
