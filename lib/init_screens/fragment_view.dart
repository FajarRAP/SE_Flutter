import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
