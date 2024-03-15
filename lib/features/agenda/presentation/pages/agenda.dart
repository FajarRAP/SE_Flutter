import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/agenda_cubit.dart';
import '../widgets/button_dan_tanggal.dart';
import '../widgets/cari_agenda.dart';
import '../widgets/item_agenda.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final TextEditingController agendaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AgendaCubit agendaCubit = context.read<AgendaCubit>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kWhite,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              title: Text(
                'Agenda',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            agendaController.text = '';
            agendaCubit.clear();
            agendaCubit.getAgendas();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 32,
            ),
            child: Column(
              children: [
                // Button dan Tanggal
                const ButtonDanTanggal(),

                const SizedBox(
                  height: 24,
                ),

                // TextField Cari Agenda
                CariAgenda(
                  agendaController: agendaController,
                ),

                const SizedBox(
                  height: 24,
                ),

                // Data
                Expanded(
                  child: BlocBuilder<AgendaCubit, AgendaState>(
                    bloc: agendaCubit..getAgendas(),
                    builder: (context, state) {
                      // Loading
                      if (state is AgendaLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Loaded
                      if (state is AgendaLoaded) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return ItemAgenda(
                              dataAgenda: state.data[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: state.data.length,
                        );
                      }

                      // Empty
                      if (state is AgendaEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              emptyDataSvg,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Saat ini tidak ada agenda',
                              style: Styles.kPoppinsSemiBold.copyWith(
                                color: kBlack,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Anda belum memiliki agenda',
                              textAlign: TextAlign.center,
                              style: Styles.kNunitoRegular.copyWith(
                                color: kNeutral90,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      }

                      // Default
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            agendaCubit.getAgendas();
                          },
                          child: const Text('Ulangi'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  void dispose() {
    agendaController.dispose();
    super.dispose();
  }
}
