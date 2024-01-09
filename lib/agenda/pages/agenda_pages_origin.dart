import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import '../helper/app_styles.dart';
import '../helper/size_config.dart';
import '../bloc/agenda_bloc.dart';
import '../models/agenda_model.dart';

class AgendaAinx extends StatelessWidget {
  const AgendaAinx({super.key});

  @override
  Widget build(BuildContext context) {
    final AgendaBloc agendaBloc = AgendaBloc();
    List<Datum> datum = [];
    String datePicked = DateFormat("M, yyyy").format(DateTime.now());
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        onRefresh: () async => agendaBloc.add(GetAgendaEvent()),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                vertical: SizeConfig.blockSizeVertical! * 3.75,
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
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 5.5,
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
                width: SizeConfig.screenWidth,
                // height: SizeConfig.screenHeight,
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
                                kata: "Berjalan",
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
                                  kata: "Selesai",
                                  warnaBg: kLightGrey,
                                  warnaFont: kNeutral60),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 1,
                            ),
                            TextButton(
                              onPressed: () {
                                showMonthPicker(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  selectedMonthTextColor: kWhite,
                                  headerColor: kBlue,
                                  unselectedMonthTextColor: kBlue,
                                  cancelWidget: const Text(
                                    'Batal',
                                    style: TextStyle(
                                      color: kNeutral80,
                                    ),
                                  ),
                                  confirmWidget: const Text(
                                    'Konfirmasi',
                                    style: TextStyle(
                                      color: kNeutral80,
                                    ),
                                  ),
                                ).then((date) {
                                  if (date != null) {
                                    agendaBloc.add(ClickCalendarEvent());
                                    datePicked =
                                        DateFormat("M, yyyy").format(date);
                                  }
                                });
                              },
                              child: BlocBuilder<AgendaBloc, AgendaState>(
                                bloc: agendaBloc,
                                builder: (context, state) {
                                  switch (state.runtimeType) {
                                    case DateCalendarPicked:
                                      return Text(
                                        "Bulan $datePicked",
                                        style: kPoppinsMedium.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.25,
                                            color: kNeutral80),
                                      );
                                  }

                                  return Text(
                                    "Bulan $datePicked",
                                    style: kPoppinsMedium.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.25,
                                        color: kNeutral80),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 1,
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
                        decoration: InputDecoration(
                          isDense: false,
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(
                            SizeConfig.blockSizeHorizontal! * 3.75,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Cari Agenda',
                          hintStyle: kNunitoRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.75,
                            color: const Color(0XffAEB1B7),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 5.5,
                    ),
                    BlocBuilder<AgendaBloc, AgendaState>(
                      bloc: agendaBloc..add(GetAgendaEvent()),
                      builder: (context, state) {
                        print(state);
                        switch (state.runtimeType) {
                          case AgendaLoading:
                            return const CircularProgressIndicator();
                          case AgendaLoaded:
                            final agendaLoadedState = state as AgendaLoaded;
                            datum = agendaLoadedState.data.data;
                            return Column(
                              children: datum
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2.85,
                                        ),
                                        width: SizeConfig.screenWidth,
                                        padding: const EdgeInsets.all(12),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.namaEvent,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: kPoppinsMedium.copyWith(
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    3.25,
                                                color: kBlack,
                                              ),
                                            ),
                                            SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  1,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Dari: ',
                                                    style:
                                                        kNunitoRegular.copyWith(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          3.25,
                                                      color: kNeutral80,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: e.unitPengundang,
                                                    style:
                                                        kNunitoRegular.copyWith(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          3.25,
                                                      color: kBlue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                e.tanggal,
                                                style: kNunitoRegular.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      2.85,
                                                  color: kNeutral70,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                        }
                        if (datum.isNotEmpty) {
                          // penanganan jika state tidak terpanggil lagi
                          return Column(
                            children: datum
                                .map(
                                  (e) => InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.85,
                                      ),
                                      width: SizeConfig.screenWidth,
                                      padding: const EdgeInsets.all(12),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.namaEvent,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: kPoppinsMedium.copyWith(
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.25,
                                              color: kBlack,
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Dari: ',
                                                  style:
                                                      kNunitoRegular.copyWith(
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        3.25,
                                                    color: kNeutral80,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: e.unitPengundang,
                                                  style:
                                                      kNunitoRegular.copyWith(
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        3.25,
                                                    color: kBlue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              e.tanggal,
                                              style: kNunitoRegular.copyWith(
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    2.85,
                                                color: kNeutral70,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }
                        return const Text("Gagal Ambil Data");
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * .8,
                    )
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
