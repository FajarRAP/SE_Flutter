
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class SudahTanggapiBimbingan extends StatelessWidget {
  const SudahTanggapiBimbingan({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/arrow-left.svg')),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeHorizontal! * 5.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 1.87),
                    width: SizeConfig.blockSizeHorizontal! * 4.25,
                    height: SizeConfig.blockSizeHorizontal! * 4.25,
                    decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadiusDirectional.circular(SizeConfig.blockSizeHorizontal! * 1)),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 3.75,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bimbingan sebelum UTS',
                        style: kPoppinsMedium.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5.5, color: kBlack),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      Text(
                        '30 juni 2023, 08.00',
                        style: kNunitoRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral80),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeHorizontal! * 5.5,
            ),
            Container(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4.675),
              width: SizeConfig.screenWidth,
              color: kLightGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth! * .75,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2.35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                      color: kWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ponco SA',
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlack),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 1,
                        ),
                        Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                          style: kNunitoRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral80),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '10.00',
                            style: kNunitoRegular.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.85, color: kNeutral70),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 3.75,
                  ),
                  Divider(),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 3.75,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: SizeConfig.screenWidth! * .75,
                      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2.35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                        ),
                        color: kBlue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                            style: kNunitoRegular.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral20),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '10.00',
                              style: kNunitoRegular.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 2.85, color: kNeutral30),
                            ),
                          )
                        ],
                      ),
                    ),
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
