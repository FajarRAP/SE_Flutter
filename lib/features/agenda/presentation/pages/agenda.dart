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
                  width: Screen.kSize24,
                  height: Screen.kSize24,
                ),
              ),
              title: Text(
                'Agenda',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: Screen.kSize20,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            agendaController.text = '';
            agendaCubit.kata = '';
            agendaCubit.tanggal = '';
            agendaCubit.getAgendas();
          },
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  Screen.kSize32,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Screen.kSize20,
              vertical: Screen.kSize32,
            ),
            child: Column(
              children: [
                // Button dan Tanggal
                const ButtonDanTanggal(),

                SizedBox(
                  height: Screen.kSize24,
                ),

                // TextField Cari Agenda
                CariAgenda(
                  agendaController: agendaController,
                ),

                SizedBox(
                  height: Screen.kSize24,
                ),

                // Data
                Expanded(
                  child: BlocBuilder<AgendaCubit, AgendaState>(
                    bloc: agendaCubit..getAgendas(),
                    builder: (context, state) {
                      if (state is AgendaLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is AgendaLoaded) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return ItemAgenda(
                              dataAgenda: agendaCubit.agenda!.data[index],
                            );
                          },
                          itemCount: agendaCubit.agenda!.data.length,
                        );
                      }
                      if (state is AgendaEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/libur-jadwal-perkuliahan.svg',
                            ),
                            SizedBox(height: Screen.kSize24),
                            Text(
                              'Saat ini tidak ada agenda',
                              style: Styles.kPoppinsSemiBold.copyWith(
                                fontSize: Screen.kSize18,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(
                              height: Screen.kSize8,
                            ),
                            Text(
                              'Anda belum memiliki agenda',
                              textAlign: TextAlign.center,
                              style: Styles.kNunitoRegular.copyWith(
                                fontSize: Screen.kSize14,
                                color: kNeutral90,
                              ),
                            ),
                          ],
                        );
                      }
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
