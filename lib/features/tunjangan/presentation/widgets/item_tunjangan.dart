import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/tunjangan_model.dart';

class ItemTunjangan extends StatelessWidget {
  final DataTunjanganModel dataTunjangan;

  const ItemTunjangan({
    super.key,
    required this.dataTunjangan,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(tunjanganDetailRoute);
      },
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Periode dan Lokasi
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataTunjangan.periode,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kBlack,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tunjangan-beras-location.svg',
                        ),
                        Text(
                          dataTunjangan.lokasiAmbil,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.kPoppinsRegular.copyWith(
                            color: kNeutral80,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const VerticalDivider(),

            // Berat Beras
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Beras',
                      style: Styles.kPoppinsRegular.copyWith(
                        color: kNeutral80,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      dataTunjangan.berat,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kBlue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
