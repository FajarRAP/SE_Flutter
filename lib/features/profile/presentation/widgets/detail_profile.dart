import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/profile_cubit.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return Row(
      children: [
        Image.asset(
          'assets/images/home-profil.png',
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  profileCubit.getNama,
                  style: Styles.kPoppinsSemiBold.copyWith(
                    color: kBlack,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              'Lektor Kepala',
              style: Styles.kNunitoRegular.copyWith(
                color: kBlue,
                fontSize: 18,
              ),
            )
          ],
        ),
      ],
    );
  }
}
