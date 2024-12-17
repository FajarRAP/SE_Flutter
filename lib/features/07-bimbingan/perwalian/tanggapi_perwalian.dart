
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class TanggapiPerwalian extends StatelessWidget {
  const TanggapiPerwalian({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
              // Jarak penyebaran shadow
              blurRadius: 4, // Radius blur shadow
              offset: Offset(0, -1),
            ) // Posisi shadow (x, y)
          ],
        ),
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kBlue,
              fixedSize: Size(SizeConfig.screenWidth!, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            'Tanggapi',
            style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeHorizontal! * 5.5,
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
                        'Perwalian sebelum UTS',
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
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 1.87),
                    decoration: const BoxDecoration(
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
                  Text(
                    'Tanggapi',
                    style: kPoppinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlack),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 1.87,
                  ),
                  MyTextField()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2.85),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 1.87)),
      height: SizeConfig.screenHeight! * .15,
      child: TextField(
        maxLines: 5,
        style: kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral90),
        decoration: InputDecoration(
          isDense: true,
          hintStyle:
              kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
          contentPadding: EdgeInsets.all(0), // Menghilangkan padding
          border: InputBorder.none, // Menghilangkan border
          hintText: 'Masukan tanggapan Anda',
        ),
      ),
    );
  }
}
