import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/agenda_cubit.dart';

class CariAgenda extends StatelessWidget {
  const CariAgenda({
    super.key,
    required this.agendaController,
  });

  final TextEditingController agendaController;

  @override
  Widget build(BuildContext context) {
    final AgendaCubit agendaCubit = context.read<AgendaCubit>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Screen.kSize12,
        ),
        boxShadow: boxShadow,
        color: kWhite,
      ),
      child: TextField(
        controller: agendaController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(
            Screen.kSize16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Screen.kSize16,
            ),
            borderSide: BorderSide.none,
          ),
          hintText: 'Cari Agenda',
          hintStyle: Styles.kNunitoRegular.copyWith(
            fontSize: Screen.kSize16,
            color: kNeutral60,
          ),
        ),
        onChanged: (value) {
          agendaCubit.kata = value;
          agendaCubit.getAgendas();
        },
      ),
    );
  }
}
