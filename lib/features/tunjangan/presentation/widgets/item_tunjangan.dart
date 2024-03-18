
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/tunjangan_model.dart';
import '../pages/detail_tunjangan.dart';

class ItemTunjangan extends StatelessWidget {

  final DataTunjangan dataTunjangan;

  const ItemTunjangan({
    super.key,
    required this.dataTunjangan
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// WILL DO
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailTunjangan(),
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x087281DF),
              blurRadius: 4.11,
              offset: Offset(0, 0.52),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0C7281DF),
              blurRadius: 6.99,
              offset: Offset(0, 1.78),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0F7281DF),
              blurRadius: 10.20,
              offset: Offset(0, 4.11),
              spreadRadius: 0,
            )
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Screen.kSize12,
                    vertical: Screen.kSize12,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataTunjangan.periode,
                        style: Styles.kPoppinsMedium
                            .copyWith(
                                fontSize:
                                    Screen.kSize14,
                                color: kBlack),
                        maxLines: 1,
                        overflow:
                            TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: Screen.kSize4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/tunjangan-beras-location.svg'),
                          SizedBox(
                            width: Screen.kSize4,
                          ),
                          Expanded(
                            child: Text(
                              dataTunjangan.lokasiAmbil,
                              maxLines: 1,
                              overflow: TextOverflow
                                  .ellipsis,
                              style: Styles
                                  .kPoppinsRegular
                                  .copyWith(
                                fontSize:
                                    Screen.kSize12,
                                color: kNeutral80,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                width: 1,
                color: kNeutral40,
              ),
              Padding(
                padding:
                    EdgeInsets.all(Screen.kSize12),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Beras',
                      style: Styles.kPoppinsRegular
                          .copyWith(
                              fontSize:
                                  Screen.kSize12,
                              color: kNeutral80),
                    ),
                    SizedBox(
                      height: Screen.kSize4,
                    ),
                    Text(
                      dataTunjangan.berat,
                      style: Styles.kPoppinsMedium
                          .copyWith(
                        fontSize: Screen.kSize16,
                        color: kBlue,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
