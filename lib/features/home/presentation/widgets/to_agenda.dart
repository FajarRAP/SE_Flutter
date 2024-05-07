import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

import '../../../agenda/presentation/cubit/agenda_cubit.dart';

class ToAgenda extends StatelessWidget {
  const ToAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    final agendaCubit = context.read<AgendaCubit>();
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, agendaRoute, arguments: true),
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
              BlocBuilder<AgendaCubit, AgendaState>(
                bloc: agendaCubit..getRekapAgenda(),
                buildWhen: (previous, current) => current is RekapAgenda,
                builder: (context, state) {
                  if (state is RekapAgendaLoaded) {
                    return Text(
                      state.data.jumlah,
                      style: Styles.kPoppinsBold.copyWith(
                        color: kWhite,
                        fontSize: 40,
                      ),
                    );
                  }

                  return const CircularProgressIndicator(color: kWhite);
                },
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
