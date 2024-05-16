import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/presensi.dart';

class ItemRekapBulanan extends StatelessWidget {
  final DataPresensi dataPresensi;
  const ItemRekapBulanan({
    super.key,
    required this.dataPresensi,
  });

  String removeMataUang(String input) {
  return input.replaceFirst('Rp.', '').trim();
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadow,
        color: kWhite,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dataPresensi.hari,
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral90,
                          ),
                        ),
                        Text(
                          dataPresensi.tanggal.substring(0, 2),
                          style: Styles.kPoppinsMedium.copyWith(
                            fontSize: 20,
                            color: kBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const VerticalDivider(width: 1),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataPresensi.statusPresensi,
                            style: Styles.kPoppinsMedium.copyWith(
                              color: kGreen,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/tunjangan-beras-location.svg',
                              ),
                              const SizedBox(width: 4),
                              SizedBox(
                                width: 140,
                                child: Text(
                                  dataPresensi.lokasi,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.kNunitoRegular.copyWith(
                                    color: kNeutral90,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Transport',
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral90,
                          ),
                        ),
                        Text(
                          removeMataUang(dataPresensi.nominalInsentif),
                          style: Styles.kPoppinsMedium.copyWith(
                            color: kBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/riwayat-presensi-masuk.svg'),
                    const SizedBox(width: 4),
                    Text(
                      'Masuk :',
                      style: Styles.kNunitoRegular.copyWith(color: kNeutral90),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dataPresensi.jamMasuk,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kBlue,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                        'assets/icons/riwayat-presensi-pulang.svg'),
                    const SizedBox(width: 4),
                    Text(
                      'Pulang :',
                      style: Styles.kNunitoRegular.copyWith(color: kNeutral90),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dataPresensi.jamPulang,
                      style: Styles.kPoppinsMedium
                          .copyWith(color: kBlue, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
