import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import '../../bloc/agenda/agenda_bloc.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../../models/agenda/agenda_model.dart';
import 'agenda-detail_page.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AgendaBloc agendaBloc = AgendaBloc();
    final TextEditingController agendaController = TextEditingController();
    List<Datum> datum = [];
    String datePicked = DateFormat('M, yyyy').format(DateTime.now());
    String tanggal = '';
    String kata = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        onRefresh: () async {
          agendaBloc.add(GetAgendaEvent(kata: kata, date: tanggal));
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                vertical: SizeConfig.blockSizeHorizontal! * 3.75,
              ),
              child: Row(
                children: [
                  // Inkwell button back,
                  Text(
                    'Agenda',
                    style: kPoppinsBold.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.675,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Container(
                // width: ,
                // height: MediaQuery.sizeOf(context).height,
                padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal! * 4.675,
                  SizeConfig.blockSizeHorizontal! * 7.5,
                  SizeConfig.blockSizeHorizontal! * 4.675,
                  SizeConfig.blockSizeHorizontal! * 7.5,
                ),
                color: const Color((0xFFF6F7F9)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const BerjalanSelesai(
                                kata: 'Berjalan',
                                warnaBg: Color(0XffEE6C4D),
                                warnaFont: kWhite,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 2.85,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const BerjalanSelesai(
                                  kata: 'Selesai',
                                  warnaBg: kLightGrey,
                                  warnaFont: kNeutral60),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                showMonthPicker(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  selectedMonthTextColor: kWhite,
                                  headerColor: kBlue,
                                  unselectedMonthTextColor: kBlue,
                                  selectedMonthBackgroundColor: kBlue,
                                  cancelWidget: const Text(
                                    'Batal',
                                    style: TextStyle(
                                      color: kGrey,
                                    ),
                                  ),
                                  confirmWidget: const Text(
                                    'Konfirmasi',
                                    style: TextStyle(
                                      color: kGrey,
                                    ),
                                  ),
                                ).then((date) {
                                  if (date != null) {
                                    tanggal =
                                        DateFormat('dd-MM-yyyy').format(date);
                                    agendaBloc.add(GetAgendaEvent(
                                        kata: kata, date: tanggal));
                                  }
                                });
                              },
                              child: Text(
                                'Bulan $datePicked',
                                style: kPoppinsMedium.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.25,
                                  color: kNeutral80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Sized box yang berisi ListView.separated
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 5.5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x087281df),
                            blurRadius: 4.11,
                            offset: Offset(0, 0.52),
                          ),
                          BoxShadow(
                            color: Color(0x0c7281df),
                            blurRadius: 6.99,
                            offset: Offset(0, 1.78),
                          ),
                          BoxShadow(
                            color: Color(0x0f7281df),
                            blurRadius: 10.20,
                            offset: Offset(0, 4.11),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: agendaController,
                        decoration: InputDecoration(
                          isDense: false,
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.all(
                            15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Cari Agenda',
                          hintStyle: kNunitoRegular.copyWith(
                            fontSize: 15,
                            color: const Color(0XffAEB1B7),
                          ),
                        ),
                        onChanged: (value) {
                          kata = value;
                          agendaBloc
                              .add(GetAgendaEvent(kata: kata, date: tanggal));
                        },
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 5.5,
                    ),
                    BlocBuilder<AgendaBloc, AgendaState>(
                      bloc: agendaBloc
                        ..add(GetAgendaEvent(kata: kata, date: tanggal)),
                      builder: (context, state) {
                        if (state is AgendaLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is AgendaLoaded) {
                          datum = state.data.data;
                          return Column(
                            children: datum
                                .map(
                                  (e) => InkWell(
                                    onTap: () {},
                                    child: ItemAgenda(
                                      namaEvent: e.namaEvent,
                                      unitPengundang: e.unitPengundang,
                                      tanggal: e.tanggal,
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }
                        return const Text('');
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * .8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemAgenda extends StatelessWidget {
  final String namaEvent;
  final String unitPengundang;
  final String tanggal;
  const ItemAgenda({
    super.key,
    required this.namaEvent,
    required this.unitPengundang,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x087281DF),
            blurRadius: 4.11,
            offset: Offset(0, 0.52),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C7281DF),
            blurRadius: 6.99,
            offset: Offset(0, 1.78),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0F7281DF),
            blurRadius: 10.20,
            offset: Offset(0, 4.11),
            spreadRadius: 0,
          )
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DetailAgenda()),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaEvent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kPoppinsMedium.copyWith(
                fontSize: 14,
                color: kBlack,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dari: ',
                    style: kNunitoRegular.copyWith(
                      fontSize: 14,
                      color: kNeutral80,
                    ),
                  ),
                  TextSpan(
                    text: unitPengundang,
                    style: kNunitoRegular.copyWith(
                      fontSize: 14,
                      color: kBlue,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                tanggal,
                style: kNunitoRegular.copyWith(
                  fontSize: 12,
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

class BerjalanSelesai extends StatelessWidget {
  final String kata;
  final Color warnaBg;
  final Color warnaFont;
  const BerjalanSelesai({
    super.key,
    required this.kata,
    required this.warnaBg,
    required this.warnaFont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: warnaBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 3.75,
        vertical: SizeConfig.blockSizeHorizontal! * 1.87,
      ),
      child: Center(
        child: Text(
          kata,
          style: kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: SizeConfig.blockSizeHorizontal! * 2.85,
          ),
        ),
      ),
    );
  }
}
