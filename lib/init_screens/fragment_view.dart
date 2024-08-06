import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../core/constants_finals.dart';
import '../features/home/presentation/pages/home.dart';
import '../features/presensi/presentation/pages/presensi_masuk.dart';
import '../features/profile/presentation/pages/profile.dart';

class FragmentView extends StatefulWidget {
  const FragmentView({super.key});

  @override
  State<FragmentView> createState() => _FragmentViewState();
}

class _FragmentViewState extends State<FragmentView> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Lokasi Dimatikan');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Perizinan Lokasi Ditolak');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Ditolak Selamanya');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> bokep() async {
    final posisi = await _determinePosition();
    final netInfo = NetworkInfo();
    final devInfo = DeviceInfoPlugin();
    final andInfo = await devInfo.androidInfo;
    print(await netInfo.getWifiBSSID());
    print(await netInfo.getWifiIP());
    print(await netInfo.getWifiName());
    print(andInfo.id);
    print('${posisi.latitude} ${posisi.longitude}');
  }

  @override
  void initState() {
    bokep();
    super.initState();
  }

  final PageController pageController = PageController();
  int indexPage = 0;
  List<Widget> pageList = [
    const HomePage(),
    const PresensiMasukPage(),
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => setState(() => indexPage = value),
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kWhite,
        currentIndex: indexPage,
        elevation: 8,
        onTap: (index) => pageController.jumpToPage(index),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/navbar-home.svg'),
            icon: SvgPicture.asset('assets/icons/navbar-home-outline.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/navbar-perkuliahan.svg'),
            icon:
                SvgPicture.asset('assets/icons/navbar-perkuliahan-outline.svg'),
            label: 'Presensi',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/navbar-profil.svg'),
            icon: SvgPicture.asset('assets/icons/navbar-profil-outline.svg'),
            label: 'Profile',
          ),
        ],
        selectedItemColor: kBlue,
        unselectedItemColor: kNeutral70,
        selectedLabelStyle: Styles.kPoppinsMedium.copyWith(
          color: kBlue,
          fontSize: 16,
        ),
        unselectedLabelStyle: Styles.kPoppinsRegular.copyWith(
          color: const Color(0xFF959AA6),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
