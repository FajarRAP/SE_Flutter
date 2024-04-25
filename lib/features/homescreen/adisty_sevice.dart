import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';

// ignore: must_be_immutable
class AdistyService extends StatelessWidget {
  AdistyService({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.link,
  });

  String img;
  String title;
  String subtitle1;
  String subtitle2;
  Widget link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(Screen.kSize16),
      width: Screen.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x087281df),
            blurRadius: 4.11,
            offset: Offset(0, 0.52),
          ),
          BoxShadow(
            color: Color(0x0c7281df),
            blurRadius: 6.99,
            offset: Offset(0, 1.78),
          ),
          BoxShadow(
            color: Color(0x0f7281df),
            blurRadius: 10.20,
            offset: Offset(0, 4.11),
          ),
          BoxShadow(
            color: Color(0x127281df),
            blurRadius: 17.75,
            offset: Offset(0, 8.10),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                img,
                width: Screen.blockSizeHorizontal * 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.kPoppinsSemiBold.copyWith(
                        fontSize: Screen.kSize18, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle1,
                        style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral80, fontSize: Screen.kSize14),
                      ),
                      Text(
                        subtitle2,
                        style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral80, fontSize: Screen.kSize14),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Screen.kSize8,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(child: link, type: PageTransitionType.fade),
              );
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  // Ganti angka sesuai keinginan
                ),
                backgroundColor: kBlue),
            child: Text(
              'Selengkapnya',
              style: Styles.kNunitoSemiBold.copyWith(fontSize: Screen.kSize14),
            ),
          )
        ],
      ),
    );
  }
}
