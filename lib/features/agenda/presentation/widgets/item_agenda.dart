import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/agenda.dart';

class ItemAgenda extends StatelessWidget {
  final DataAgendaModel dataAgenda;
  const ItemAgenda({
    super.key,
    required this.dataAgenda,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadow,
        color: kWhite,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(agendaDetailRoute);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataAgenda.namaEvent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.kPoppinsMedium.copyWith(
                color: kBlack,
                fontSize: 14,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dari: ',
                    style: Styles.kNunitoRegular.copyWith(
                      color: kNeutral80,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: dataAgenda.unitPengundang,
                    style: Styles.kNunitoRegular.copyWith(
                      color: kBlue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                dataAgenda.tanggal,
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral70,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
