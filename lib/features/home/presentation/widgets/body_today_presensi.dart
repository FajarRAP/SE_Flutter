import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../../presensi/data/models/today_presensi.dart';

class BodyTodayPresensi extends StatelessWidget {
  final DataTodayPresensiModel data;

  String removeRp(String input) {
    return input.replaceFirst("Rp. ", "");
  }

  const BodyTodayPresensi({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${data.hari},',
          style: Styles.kPoppinsBold.copyWith(
            color: kWhite,
            fontSize: 24,
          ),
        ),
        // const SizedBox(
        //   height: 2,
        // ),
        Text(
          '${data.tanggal}',
          style: Styles.kPoppinsBold.copyWith(
            color: kWhite,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Icon(
        //       Icons.pin_drop,
        //       color: Color(0xFFF1416C),
        //       size: 20.0,
        //     ),
        //     const SizedBox(width: 4),
        //     Text(
        //       data.lokasiKampus,
        //       style: Styles.kPoppinsMedium.copyWith(
        //         fontSize: 16,
        //         color: kWhite,
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            const Icon(
              Icons.pin_drop,
              color: Color(0xFFF1416C),
              size: 20.0,
            ),
            Expanded(
              child: Text(
                data.lokasiGedung,
                textAlign: TextAlign.center,
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 12,
                  color: kWhite,
                ),
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/home-presensi-masuk.svg'),
                    const SizedBox(width: 4),
                    Text(
                      'Masuk',
                      style: Styles.kNunitoRegular.copyWith(
                        color: kWhite,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  data.jamMasuk,
                  style: Styles.kPoppinsBold.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/home-presensi-pulang.svg'),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Pulang',
                      style: Styles.kNunitoRegular.copyWith(
                        color: kWhite,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  data.jamPulang,
                  style: Styles.kPoppinsBold.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: kWhite,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  data.statusPresensi,
                  style: Styles.kPoppinsSemiBold.copyWith(
                    color: kWhite,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: kWhite,
                  size: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  removeRp(data.nominalInsentif),
                  maxLines: 1,
                  style: Styles.kPoppinsSemiBold.copyWith(
                    color: kWhite,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
