import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class TodayPresensi extends StatelessWidget {
  const TodayPresensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          // Navigator.push(
          //   context,
          //   PageTransition(
          //     duration: const Duration(milliseconds: 100),
          //     child: const DetailPresensiHariIni(),
          //     type: PageTransitionType.fade,
          //   ),
          // );
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: kBlue,
          ),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/tendik.png',
                  width: 125,
                ),
              ),
              Text(
                'Presensi Hari Ini',
                style: Styles.kNunitoSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 14,
                ),
              ),
              Text(
                '07.00',
                style: Styles.kPoppinsBold.copyWith(
                  color: kWhite,
                  fontSize: 40,
                ),
              ),
              Text(
                "Jum'at, 13 Oktober",
                style: Styles.kPoppinsMedium.copyWith(
                  color: kWhite,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/home-presensi-masuk.svg'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Masuk',
                            style: Styles.kNunitoRegular.copyWith(
                              color: kWhite,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '06.45',
                        style: Styles.kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/home-presensi-pulang.svg'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Pulang',
                            style: Styles.kNunitoRegular.copyWith(
                              color: kWhite,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '17.04',
                        style: Styles.kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
