import 'package:flutter/material.dart';

import '../../utils/cuti_constant_finals.dart';

class ContainerDesigned extends StatelessWidget {
  final Widget widget;
  const ContainerDesigned({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadow,
        color: kWhite,
      ),
      padding: const EdgeInsets.all(16),
      child: widget,
    );
  }
}
