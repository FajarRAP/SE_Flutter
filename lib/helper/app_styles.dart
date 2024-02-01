import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_config.dart';

const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF293241);
const Color kGrey = Color(0xFF7A8089);
const Color kLightGrey = Color(0XFFF0F1F2);
const Color kNeutral10 = Color(0xFFFFFFFF);
const Color kNeutral20 = Color(0xFFF6F7F7);
const Color kNeutral30 = Color(0xFFF0F1F2);
const Color kNeutral40 = Color(0xFFE5E6E8);
const Color kNeutral50 = Color(0xFFCCCED1);
const Color kNeutral60 = Color(0xFFAEB1B7);
const Color kNeutral70 = Color(0xFF8391A1);
const Color kNeutral80 = Color(0xFF7A8089);
const Color kNeutral90 = Color(0xFF5F6570);
const Color kNeutral100 = Color(0xFF293241);

const Color bgColor = Color((0xFFF6F7F9));
const Color kBlue = Color(0xFF2B86C4);
const Color kOrange = Color(0xFFFB7F54);
const Color kYellow = Color(0xFFFFAC30);
const Color kGreen = Color(0xFF4AAF57);
const Color kGreenComplete = Color(0xFF18C07A);
const Color kRed = Color(0xFFE65768);

final kPoppinsBold = GoogleFonts.poppins(fontWeight: FontWeight.w700);
final kPoppinsSemiBold = GoogleFonts.poppins(fontWeight: FontWeight.w600);
final kPoppinsMedium = GoogleFonts.poppins(fontWeight: FontWeight.w500);
final kPoppinsRegular = GoogleFonts.poppins(fontWeight: FontWeight.w400);

final kNunitoBold = GoogleFonts.nunito(fontWeight: FontWeight.w700);
final kNunitoSemiBold = GoogleFonts.nunito(fontWeight: FontWeight.w600);
final kNunitoMedium = GoogleFonts.nunito(fontWeight: FontWeight.w500);
final kNunitoRegular = GoogleFonts.nunito(fontWeight: FontWeight.w400);

final kSize4 = SizeConfig.blockSizeHorizontal! * 1;
final kSize8 = SizeConfig.blockSizeHorizontal! * 1.87;
final kSize10 = SizeConfig.blockSizeHorizontal! * 2.35;
final kSize12 = SizeConfig.blockSizeHorizontal! * 2.85;
final kSize14 = SizeConfig.blockSizeHorizontal! * 3.25;
final kSize16 = SizeConfig.blockSizeHorizontal! * 3.75;
final kSize18 = SizeConfig.blockSizeHorizontal! * 4.25;
final kSize20 = SizeConfig.blockSizeHorizontal! * 4.675;
final kSize24 = SizeConfig.blockSizeHorizontal! * 5.5;
final kSize28 = SizeConfig.blockSizeHorizontal! * 6.55;
final kSize32 = SizeConfig.blockSizeHorizontal! * 7.5;
final kSize40 = SizeConfig.blockSizeHorizontal! * 9.35;

const List<BoxShadow> boxShadow = [
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
];

Future<void> successDialog(BuildContext context, String kata, String keterangan) {
  return showDialog<void>(
    context: context,
    barrierColor: const Color(0xCC293241),
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(kSize40),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSize24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/check.svg'),
            SizedBox(height: kSize24),
            Text(
              kata,
              style: kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: kSize20,
              ),
            ),
            SizedBox(height: kSize8),
            Text(
              keterangan,
              textAlign: TextAlign.center,
              style: kNunitoRegular.copyWith(
                color: kNeutral70,
                fontSize: kSize14,
              ),
            ),
            SizedBox(height: kSize40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlue,
                fixedSize: Size(SizeConfig.screenWidth!, kSize40 + kSize16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSize40)),
              ),
              child: Text(
                'Oke',
                style: kPoppinsMedium.copyWith(
                  color: kWhite,
                  fontSize: kSize16,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
