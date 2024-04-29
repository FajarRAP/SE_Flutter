import 'package:flutter/material.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

class ToAgenda extends StatelessWidget {
  const ToAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, agendaRoute),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: kOrange,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Agenda',
                style: Styles.kPoppinsBold.copyWith(
                  color: kWhite,
                  fontSize: 18,
                ),
              ),
              Text(
                '2',
                style: Styles.kPoppinsBold.copyWith(
                  color: kWhite,
                  fontSize: 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hari ini',
                    style: Styles.kNunitoBold.copyWith(
                      color: kWhite,
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
