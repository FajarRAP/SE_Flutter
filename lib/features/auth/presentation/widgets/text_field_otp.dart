import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants_finals.dart';

class TextFieldOTP extends StatelessWidget {
  const TextFieldOTP({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      onSaved: (pin1) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBlue,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xFFE8ECF4),
          ),
        ),
      ),
      style: Styles.kPoppinsSemiBold.copyWith(
        color: kBlack,
        fontSize: 24,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
