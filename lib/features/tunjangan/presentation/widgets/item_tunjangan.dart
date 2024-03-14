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
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: boxShadow,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
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
                      style: Styles.kPoppinsMedium.copyWith(
                        fontSize: 14,
                        color: kBlack,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                            fontSize: 12,
                            color: kNeutral80,
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
                        fontSize: 12,
                        color: kNeutral80,
                      ),
                    ),
                    Text(
                      dataTunjangan.berat,
                      style: Styles.kPoppinsMedium.copyWith(
                        fontSize: 16,
                        color: kBlue,
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
