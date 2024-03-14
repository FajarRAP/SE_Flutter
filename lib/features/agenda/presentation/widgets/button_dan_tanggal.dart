import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/agenda_cubit.dart';
import 'button_berjalan_selesai.dart';

class ButtonDanTanggal extends StatelessWidget {
  const ButtonDanTanggal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AgendaCubit agendaCubit = context.read<AgendaCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AgendaCubit, AgendaState>(
          bloc: agendaCubit,
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    agendaCubit.isBerjalan = true;
                    agendaCubit.getAgendas();
                  },
                  child: ButtonBerjalanSelesai(
                    kata: 'Berjalan',
                    warnaBg: agendaCubit.isBerjalan ? bgButton : kLightGrey,
                    warnaFont: agendaCubit.isBerjalan ? kWhite : kNeutral60,
                  ),
                ),
                SizedBox(width: Screen.kSize12),
                InkWell(
                  onTap: () {
                    agendaCubit.isBerjalan = false;
                    agendaCubit.getAgendas();
                  },
                  child: ButtonBerjalanSelesai(
                    kata: 'Selesai',
                    warnaBg: !agendaCubit.isBerjalan ? bgButton : kLightGrey,
                    warnaFont: !agendaCubit.isBerjalan ? kWhite : kNeutral60,
                  ),
                ),
              ],
            );
          },
        ),
        Row(
          children: [
            TextButton(
              onPressed: () async {
                final DateTime? date = await ourMonthPicker(context);
                if (date != null) {
                  agendaCubit.tanggal = DateFormat('dd-MM-yyyy').format(date);
                  agendaCubit.datePicked = DateFormat('M, yyyy').format(date);
                  agendaCubit.getAgendas();
                }
              },
              child: BlocBuilder<AgendaCubit, AgendaState>(
                bloc: agendaCubit,
                builder: (context, state) {
                  return Text(
                    'Bulan ${agendaCubit.datePicked}',
                    style: Styles.kPoppinsMedium.copyWith(
                      fontSize: Screen.kSize14,
                      color: kNeutral80,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
