import 'package:flutter/material.dart';
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    data.lokasiGedung,
                    style: Styles.kPoppinsBold.copyWith(
                      color: kWhite,
                      fontSize: 14,
                    ),
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${data.hari},\n${data.tanggal}',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kWhite,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      jamPresensi(
                        icon: 'assets/icons/home-presensi-masuk.svg',
                        title: 'Masuk',
                        value: data.jamMasuk,
                      ),
                      jamPresensi(
                        icon: 'assets/icons/home-presensi-pulang.svg',
                        title: 'Pulang',
                        value: data.jamPulang,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ketepatanDanInsentif(
                        icon: Icons.calendar_month,
                        value: data.statusPresensi,
                      ),
                      ketepatanDanInsentif(
                        icon: Icons.monetization_on,
                        value: removeRp(data.nominalInsentif),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget jamPresensi({
  required String icon,
  required String title,
  required String value,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 15,
            width: 15,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: Styles.kPoppinsMedium.copyWith(
              color: kWhite,
              fontSize: 10,
            ),
          ),
        ],
      ),
      Text(
        value,
        style: Styles.kPoppinsSemiBold.copyWith(
          color: kWhite,
          fontSize: 15,
        ),
      ),
    ],
  );
}

Widget ketepatanDanInsentif({
  required IconData icon,
  required String value,
}) {
  return Row(
    children: [
      Icon(
        icon,
        color: kWhite,
        size: 10,
      ),
      const SizedBox(width: 4),
      Text(
        value,
        style: Styles.kPoppinsSemiBold.copyWith(
          color: kWhite,
          fontSize: 12,
        ),
      ),
    ],
  );
}
