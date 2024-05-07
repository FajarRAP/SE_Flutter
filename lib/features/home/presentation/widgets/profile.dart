import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../../core/constants_finals.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return Row(
      children: [
        Image.asset('assets/images/home-profil.png'),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 225,
              child: BlocBuilder<ProfileCubit, ProfileState>(
                bloc: profileCubit..getProfile(),
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return Text(
                      'Hallo ${state.data.nama} 👋',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                  return Text(
                    '...',
                    style: Styles.kPoppinsSemiBold.copyWith(
                      color: kBlack,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            Text(
              'Selamat datang di ADISTY',
              style: Styles.kNunitoRegular.copyWith(
                color: kGrey,
                fontSize: 14,
              ),
            )
          ],
        ),
      ],
    );
  }
}
