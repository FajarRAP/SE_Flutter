import 'package:flutter/material.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

class Presensi extends StatelessWidget {
  const Presensi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(context, monitoringRoute);
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Color(0xFFD5ECFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Presensi',
                style: Styles.kPoppinsBold.copyWith(
                  color: kBlack,
                  fontSize: 18,
                ),
              ),
              Text(
                '19',
                style: Styles.kPoppinsBold.copyWith(
                  color: kBlack,
                  fontSize: 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bulan ini',
                    style: Styles.kNunitoBold.copyWith(
                      color: kBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
