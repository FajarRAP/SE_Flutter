import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/detail_gaji_cubit.dart';

class CardTop extends StatelessWidget {
  const CardTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DetailGajiCubit detailGajiCubit = context.read<DetailGajiCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 32,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailGajiCubit.getNominalGaji,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kWhite,
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 4),
            
            Text(
              detailGajiCubit.getBulanGaji,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral20,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
