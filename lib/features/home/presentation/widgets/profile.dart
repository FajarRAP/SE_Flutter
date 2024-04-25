import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/home-profil.png'),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 225,
              child: Text(
                'Hallo Agung 👋',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kBlack,
                  fontSize: 20,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
