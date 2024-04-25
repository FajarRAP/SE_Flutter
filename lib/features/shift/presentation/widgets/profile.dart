import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        child: Column(
          children: [
            // Foto dan Profil
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/circled_user_female.svg',
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lalu Ramadhan',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kBlack,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '2100018128',
                        style: Styles.kPoppinsRegular.copyWith(
                          color: kBlue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // Unit Kerja dan Posisi
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                children: [
                  // Teks Unit Kerja dan Posisi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unit Kerja',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kNeutral70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Posisi',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kNeutral70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 8),

                  // Teks :
                  Column(
                    children: [
                      Text(
                        ':',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kNeutral70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        ':',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kNeutral70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 8),

                  // Teks Value dari Unit Kerja dan Posisi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keamanan',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kBlack,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Satpam',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kBlack,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
