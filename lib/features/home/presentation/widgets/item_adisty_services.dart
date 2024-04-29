import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class ItemAdistyService extends StatelessWidget {
  const ItemAdistyService({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.path,
  });

  final String img;
  final String title;
  final String subtitle;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x087281df),
            blurRadius: 4.11,
            offset: Offset(0, 0.52),
          ),
          BoxShadow(
            color: Color(0x0c7281df),
            blurRadius: 6.99,
            offset: Offset(0, 1.78),
          ),
          BoxShadow(
            color: Color(0x0f7281df),
            blurRadius: 10.20,
            offset: Offset(0, 4.11),
          ),
          BoxShadow(
            color: Color(0x127281df),
            blurRadius: 17.75,
            offset: Offset(0, 8.10),
          ),
        ],
        color: kWhite,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                img,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.kPoppinsSemiBold.copyWith(
                      color: kBlack,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 225,
                    child: Text(
                      subtitle,
                      style: Styles.kNunitoRegular.copyWith(
                        color: kNeutral80,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, path),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: kBlue,
            ),
            child: Text(
              'Selengkapnya',
              style: Styles.kNunitoSemiBold.copyWith(
                color: kWhite,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
