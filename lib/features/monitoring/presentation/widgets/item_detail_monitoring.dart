import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


import '../../data/models/daftar_presensi_model.dart';
import '../../utils/monitoring_constants_finals.dart';

class ItemDetailMonitoring extends StatelessWidget {
  Future<void> initializeDateFormattingCustom() async {
    await initializeDateFormatting('id_ID', null);
  }

  // Fungsi untuk memformat tanggal
  String formatDate(String dateString) {
    DateTime dateTime = DateFormat('d MMMM y', 'id_ID').parse(dateString);
    String formattedDate = DateFormat('d').format(dateTime);
    return formattedDate;
  }

  // Fungsi buat hilangin Rp
  String removeRp(String input) {
    return input.replaceFirst("Rp. ", "");
  }

  final DataDaftarPresensi dataDaftarPresensi;
  const ItemDetailMonitoring({
    super.key,
    required this.dataDaftarPresensi,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormattingCustom();
    final bool isOnTime =
        dataDaftarPresensi.statusPresensi.toLowerCase() == "tepat waktu";
    final bool isTelat =
        dataDaftarPresensi.statusPresensi.toLowerCase() == "telat";

    final bool isAbsen =
        dataDaftarPresensi.statusPresensi.toLowerCase() == "absen";

    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhite,
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            dataDaftarPresensi.hari,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.kPoppinsMedium.copyWith(
                              color: kNeutral80,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            formatDate(dataDaftarPresensi.tanggal),
                            style: Styles.kNunitoBold.copyWith(
                              color: kBlack,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: kNeutral30,
                      width: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          dataDaftarPresensi.statusPresensi,
                          style: Styles.kPoppinsMedium.copyWith(
                            color: isAbsen
                                ? kRed
                                : isOnTime
                                    ? kGreen
                                    : isTelat
                                        ? kYellow
                                        : kBlack,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/tunjangan-beras-location.svg',
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataDaftarPresensi.lokasi,
                              style: Styles.kNunitoMedium.copyWith(
                                color: kNeutral80,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    const VerticalDivider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Transport',
                          style: Styles.kPoppinsRegular.copyWith(
                            color: kGrey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          removeRp(dataDaftarPresensi.nominalInsentif),
                          style: Styles.kPoppinsMedium.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: kGrey.withOpacity(20 / 100),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/tendik/icons/riwayat-presensi-masuk.svg',
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Masuk : ',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kNeutral90,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    dataDaftarPresensi.jamMasuk,
                    style: Styles.kPoppinsSemiBold.copyWith(
                      color: kBlue,
                      fontSize: 14,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  SvgPicture.asset(
                    'assets/tendik/icons/riwayat-presensi-pulang.svg',
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Pulang : ',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kNeutral90,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    dataDaftarPresensi.jamPulang,
                    style: Styles.kPoppinsSemiBold.copyWith(
                      color: kBlue,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
