import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';



class AppBarLupaPassword extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarLupaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhite,
      centerTitle: true,
      elevation: 4,
      shadowColor: const Color(0x25293241),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(
          'assets/icons/arrow-left.svg',
          colorFilter: const ColorFilter.mode(
            kBlue,
            BlendMode.srcIn,
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        'Lupa password',
        style: Styles.kPoppinsMedium.copyWith(
          color: kBlack,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
