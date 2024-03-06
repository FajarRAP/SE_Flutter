import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/agenda.dart';
import '../pages/detail_agenda.dart';

class ItemAgenda extends StatelessWidget {
  final DataAgendaModel dataAgenda;
  const ItemAgenda({
    super.key,
    required this.dataAgenda,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Screen.kSize12),
      padding: EdgeInsets.all(Screen.kSize12),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Screen.kSize12),
        ),
        shadows: boxShadow,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DetailAgendaPage()),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataAgenda.namaEvent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.kPoppinsMedium.copyWith(
                fontSize: Screen.kSize14,
                color: kBlack,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dari: ',
                    style: Styles.kNunitoRegular.copyWith(
                      fontSize: Screen.kSize14,
                      color: kNeutral80,
                    ),
                  ),
                  TextSpan(
                    text: dataAgenda.unitPengundang,
                    style: Styles.kNunitoRegular.copyWith(
                      fontSize: Screen.kSize14,
                      color: kBlue,
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
                  fontSize: Screen.kSize12,
                  color: kNeutral70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
