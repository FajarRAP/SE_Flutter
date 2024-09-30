import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/shift_constant_finals.dart';
import '../cubit/shift_cubit.dart';

class ButtonShift extends StatelessWidget {
  final String day;
  final int current;
  const ButtonShift({
    super.key,
    required this.day,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    final ShiftCubit shiftCubit = context.read<ShiftCubit>();

    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: current == shiftCubit.getCurrentDay ? bgButton : kLightGrey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Center(
        child: Text(
          day,
          style: Styles.kPoppinsRegular.copyWith(
            color: current == shiftCubit.getCurrentDay ? kWhite : kNeutral60,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
