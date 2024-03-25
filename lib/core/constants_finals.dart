import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// API
const String url = 'http://d3v.uad.id/';
const String route = 'ipm/index.php/auth/';
const Map<String, String> endpoint = {
  'agenda': 'agenda?',
  'detailAgenda': 'detil_agenda',
  'daftarCuti': 'daftar_cuti',
  'rekapCuti': 'rekap_cuti',
  'monitoring': 'monitoring',
  'rekapMonitoring': 'monitoring_rekap',
  'detailMonitoring': 'monitoring_detil',
  'gaji': 'gaji',
  'detailGaji': 'gaji_detil',
  'shift': 'jadwal_shift',
  'tunjangan': 'tunjangan_beras',
  'detailTunjangan': 'detil_tunjangan_beras',
};

// Assets Location
const String arrowBackSvg = 'assets/icons/arrow-left.svg';
const String penEditSvg = 'assets/icons/edit-2.svg';
const String emptyDataSvg = 'assets/icons/libur-jadwal-perkuliahan.svg';
const String pemasukanSvg = 'assets/icons/pemasukan.svg';
const String pengeluaranSvg = 'assets/icons/potongan.svg';

// Colors
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
const Color bgButton = Color(0XffEE6C4D);
const Color kBlue = Color(0xFF2B86C4);
const Color kOrange = Color(0xFFFB7F54);
const Color kYellow = Color(0xFFFFAC30);
const Color kGreen = Color(0xFF4AAF57);
const Color kGreenComplete = Color(0xFF18C07A);
const Color kRed = Color(0xFFE65768);

// Box Shadow
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

/// Ini adalah class untuk mendapatkan ukuran relatif dari suatu perangkat
///
/// kSize adalah ukuran pixel yang direlatifkan,
/// misalnya height: 16 (16 Di sini adalah ukuran absolut) maka dengan menggunakan kSize16 itu akan relatif terhadap perangkat.
///
/// Atau jika ingin mengisi tinggi setinggi device, maka tinggal seperti ini height: Screen.height
class Screen {
  static final FlutterView view =
      WidgetsBinding.instance.platformDispatcher.views.first;
  static final Size size = view.physicalSize / view.devicePixelRatio;

  static final double width = size.width;
  static final double height = size.height;

  static final double blockSizeHorizontal = width / 100;
  static final double blockSizeVertical = height / 100;

  static final double kSize4 = blockSizeHorizontal * 1;
  static final double kSize8 = blockSizeHorizontal * 1.87;
  static final double kSize10 = blockSizeHorizontal * 2.35;
  static final double kSize12 = blockSizeHorizontal * 2.85;
  static final double kSize14 = blockSizeHorizontal * 3.25;
  static final double kSize16 = blockSizeHorizontal * 3.75;
  static final double kSize18 = blockSizeHorizontal * 4.25;
  static final double kSize20 = blockSizeHorizontal * 4.675;
  static final double kSize24 = blockSizeHorizontal * 5.5;
  static final double kSize28 = blockSizeHorizontal * 6.55;
  static final double kSize32 = blockSizeHorizontal * 7.5;
  static final double kSize40 = blockSizeHorizontal * 9.35;
}

class Styles {
  static final TextStyle kPoppinsBold =
      GoogleFonts.poppins(fontWeight: FontWeight.w700);
  static final TextStyle kPoppinsSemiBold =
      GoogleFonts.poppins(fontWeight: FontWeight.w600);
  static final TextStyle kPoppinsMedium =
      GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static final TextStyle kPoppinsRegular =
      GoogleFonts.poppins(fontWeight: FontWeight.w400);

  static final TextStyle kNunitoBold =
      GoogleFonts.nunito(fontWeight: FontWeight.w700);
  static final TextStyle kNunitoSemiBold =
      GoogleFonts.nunito(fontWeight: FontWeight.w600);
  static final TextStyle kNunitoMedium =
      GoogleFonts.nunito(fontWeight: FontWeight.w500);
  static final TextStyle kNunitoRegular =
      GoogleFonts.nunito(fontWeight: FontWeight.w400);
}

// Nama Rute
const String homeRoute = '/';
const String agendaRoute = '${homeRoute}agenda/';
const String agendaDetailRoute = '${agendaRoute}detail/';
const String layananCutiRoute = '${homeRoute}layananCuti/';
const String layananCutiSuntingRoute = '${layananCutiRoute}sunting/';
const String layananCutiTambahRoute = '${layananCutiRoute}tambah/';
const String monitoringRoute = '${homeRoute}monitoring/';
const String monitoringDetailRoute = '${monitoringRoute}detail/';
const String gajiRoute = '${homeRoute}gaji/';
const String gajiDetailRoute = '${gajiRoute}detail/';
const String shiftRoute = '${homeRoute}shift/';
const String tunjanganRoute = '${homeRoute}tunjangan/';
const String tunjanganDetailRoute = '${tunjanganRoute}detail/';

// Hari
const List<String> days = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jum\'at',
  'Sabtu',
];
