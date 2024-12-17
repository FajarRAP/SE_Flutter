import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    super.key,
    required this.isObsecure,
    required this.labelText,
    required this.controller,
    required this.onTap,
  });

  final bool isObsecure;
  final String labelText;
  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        floatingLabelStyle: Styles.kNunitoRegular.copyWith(
          color: kGrey,
          fontSize: 16,
        ),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        labelStyle: Styles.kNunitoRegular.copyWith(
          color: kNeutral70,
          fontSize: 16,
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        suffixIcon: InkWell(
          onTap: onTap,
          child: isObsecure
              ? SvgPicture.asset(
                  'assets/icons/eye.svg',
                  colorFilter: const ColorFilter.mode(
                    kNeutral80,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  'assets/icons/eye-slash.svg',
                  colorFilter: const ColorFilter.mode(
                    kNeutral80,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: kBlue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xFFE8ECF4),
          ),
        ),
      ),
    );
  }
}
