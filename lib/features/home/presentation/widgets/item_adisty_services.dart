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
        boxShadow: boxShadow,
        color: kWhite,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, path),
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
                      width: 200,
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
          ],
        ),
      ),
    );
  }
}
