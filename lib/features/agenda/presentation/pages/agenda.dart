import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../../../layanan_cuti/pages/layanan_cuti.dart';
import '../cubit/agenda_cubit.dart';
import '../widgets/item_agenda.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final TextEditingController agendaController = TextEditingController();
  final ScrollController scrollController = ScrollController();

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
                  'assets/icons/arrow-left.svg',
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
                Row(
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
                              child: BerjalanSelesai(
                                kata: 'Berjalan',
                                warnaBg: agendaCubit.isBerjalan
                                    ? const Color(0XffEE6C4D)
                                    : kLightGrey,
                                warnaFont: agendaCubit.isBerjalan
                                    ? kWhite
                                    : kNeutral60,
                              ),
                            ),
                            SizedBox(width: Screen.kSize12),
                            InkWell(
                              onTap: () {
                                agendaCubit.isBerjalan = false;
                                agendaCubit.getAgendas();
                              },
                              child: BerjalanSelesai(
                                kata: 'Selesai',
                                warnaBg: !agendaCubit.isBerjalan
                                    ? const Color(0XffEE6C4D)
                                    : kLightGrey,
                                warnaFont: !agendaCubit.isBerjalan
                                    ? kWhite
                                    : kNeutral60,
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
                            final DateTime? date =
                                await ourMonthPicker(context);
                            if (date != null) {
                              agendaCubit.tanggal =
                                  DateFormat('dd-MM-yyyy').format(date);
                              agendaCubit.datePicked =
                                  DateFormat('M, yyyy').format(date);
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
                ),
                SizedBox(height: Screen.kSize24),
                // TextField
                Container(
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
                      contentPadding: EdgeInsets.all(Screen.kSize16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Screen.kSize16),
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
                ),
                SizedBox(height: Screen.kSize24),
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
                                dataAgenda: agendaCubit.agenda!.data[index]);
                          },
                          itemCount: agendaCubit.agenda!.data.length,
                        );
                      }
                      if (state is AgendaEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/libur-jadwal-perkuliahan.svg'),
                            SizedBox(height: Screen.kSize24),
                            Text(
                              'Saat ini tidak ada agenda',
                              style: Styles.kPoppinsSemiBold.copyWith(
                                fontSize: Screen.kSize18,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: Screen.kSize8),
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
