import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants_finals.dart';
import 'logout_modal.dart';

class ItemAkunSaya extends StatelessWidget {
  final String path;
  final String title;
  final Widget page;
  final bool isLogout;
  const ItemAkunSaya({
    super.key,
    required this.path,
    required this.title,
    required this.page,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => !isLogout
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            )
          : logoutModal(context),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                path,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Styles.kNunitoRegular.copyWith(
                    color: kBlack,
                    fontSize: 16,
                  ),
                ),
              ),
              SvgPicture.asset('assets/icons/arrow-right.svg'),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
        ],
      ),
    );
  }
}
