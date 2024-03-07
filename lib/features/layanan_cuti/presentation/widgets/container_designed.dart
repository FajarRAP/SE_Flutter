import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class ContainerDesigned extends StatelessWidget {
  final Widget widget;
  const ContainerDesigned({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Screen.kSize12,
          ),
        ),
        shadows: boxShadow,
      ),
      padding: EdgeInsets.all(
        Screen.kSize16,
      ),
      child: widget,
    );
  }
}
