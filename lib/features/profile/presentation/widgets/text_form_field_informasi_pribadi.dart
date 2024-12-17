import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class TextFormFieldInformasiPribadi extends StatelessWidget {
  const TextFormFieldInformasiPribadi({
    super.key,
    required this.formKey,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.validator,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral70,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '*',
              style: Styles.kNunitoRegular.copyWith(
                color: kRed,
              ),
            ),
          ],
        ),
        Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            style: Styles.kPoppinsRegular.copyWith(
              color: kBlack,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              errorStyle: Styles.kPoppinsRegular.copyWith(
                color: kRed,
              ),
              border: const UnderlineInputBorder(),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kRed,
                ),
              ),
              // hintText: 'Cth: Agung NH',
              hintText: hintText,
              hintStyle: Styles.kPoppinsRegular.copyWith(
                color: kNeutral70,
                fontSize: 16,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kBlue,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kNeutral40,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kRed,
                ),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
