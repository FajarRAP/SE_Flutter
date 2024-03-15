import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    agendaCubit.clickBerjalan();
                    agendaCubit.getAgendas();
                  },
                  child: ButtonBerjalanSelesai(
                    kata: 'Berjalan',
                    isBerjalan: agendaCubit.getIsBerjalan,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    agendaCubit.clickSelesai();
                    agendaCubit.getAgendas();
                  },
                  child: ButtonBerjalanSelesai(
                    kata: 'Selesai',
                    isBerjalan: !agendaCubit.getIsBerjalan,
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
                  agendaCubit.setTanggal = date;
                  agendaCubit.setDatePicked = date;
                  agendaCubit.getAgendas();
                }
              },
              child: BlocBuilder<AgendaCubit, AgendaState>(
                bloc: agendaCubit,
                builder: (context, state) {
                  return Text(
                    'Bulan ${agendaCubit.getDatePicked}',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kNeutral80,
                      fontSize: 14,
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
