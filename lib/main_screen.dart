import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'core/constants_finals.dart';
import 'features/home/presentation/pages/home.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexPage = 0;
  List<Widget> pageList = [
    const HomePage(),
    // const PresensiMasuk(),
    // const Profil()
  ];
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          elevation: 8,
          backgroundColor: kWhite,
          currentIndex: indexPage,
          onTap: (index) {
            setState(() {
              indexPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: [
                    SvgPicture.asset('assets/icons/navbar-home.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                icon: Column(
                  children: [
                    SvgPicture.asset('assets/icons/navbar-home-outline.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: [
                    SvgPicture.asset('assets/icons/navbar-perkuliahan.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                        'assets/icons/navbar-perkuliahan-outline.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                label: 'Presensi'),
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: [
                    SvgPicture.asset('assets/icons/navbar-profil.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                icon: Column(
                  children: [
                    SvgPicture.asset('assets/icons/navbar-profil-outline.svg'),
                    SizedBox(height: Screen.kSize4),
                  ],
                ),
                label: 'Profile'),
          ],
          selectedItemColor: kBlue,
          unselectedItemColor: kNeutral70,
          selectedLabelStyle:
              Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlue),
          unselectedLabelStyle: Styles.kPoppinsRegular.copyWith(
              fontSize: Screen.kSize14, color: const Color(0xFF959AA6)),
        ),
      ),
      body: IndexedStack(
        children: pageList,
        index: indexPage,
      ),
    );
  }
}
