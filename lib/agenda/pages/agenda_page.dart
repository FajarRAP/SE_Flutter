import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../helper/app_styles.dart';
import '../../../helper/size_config.dart';

import '../bloc/agenda_bloc.dart';
import '../models/agenda_model.dart';
import 'agenda-detail_page.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AgendaBloc agendaBloc = AgendaBloc();
    final TextEditingController agendaController = TextEditingController();
    String datePicked = DateFormat('M, yyyy').format(DateTime.now());
    String tanggal = '';
    String kata = 'Berjalan';
    bool isBerjalan = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        onRefresh: () async => agendaBloc.add(GetAgendaEvent(
            kata: kata, tanggal: tanggal, isBerjalan: isBerjalan)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kSize20,
                vertical: kSize16,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-left.svg',
                      colorFilter:
                          const ColorFilter.mode(kWhite, BlendMode.srcIn),
                      fit: BoxFit.scaleDown,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(
                    width: kSize24,
                  ),
                  Text(
                    'Agenda',
                    style: kPoppinsBold.copyWith(
                      color: kWhite,
                      fontSize: kSize20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: kSize20,
                vertical: kSize32,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<AgendaBloc, AgendaState>(
                        bloc: agendaBloc,
                        builder: (context, state) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  isBerjalan = true;
                                  agendaBloc.add(GetAgendaEvent(
                                      kata: 'Berjalan',
                                      tanggal: tanggal,
                                      isBerjalan: true));
                                },
                                child: BerjalanSelesai(
                                  kata: 'Berjalan',
                                  warnaBg: !isBerjalan
                                      ? kLightGrey
                                      : const Color(0XffEE6C4D),
                                  warnaFont: !isBerjalan ? kNeutral60 : kWhite,
                                ),
                              ),
                              SizedBox(width: kSize12),
                              GestureDetector(
                                onTap: () {
                                  isBerjalan = false;
                                  agendaBloc.add(GetAgendaEvent(
                                      kata: 'Selesai',
                                      tanggal: tanggal,
                                      isBerjalan: isBerjalan));
                                },
                                child: BerjalanSelesai(
                                  kata: 'Selesai',
                                  warnaBg: !isBerjalan
                                      ? const Color(0XffEE6C4D)
                                      : kLightGrey,
                                  warnaFont: !isBerjalan ? kWhite : kNeutral60,
                                ),
                              ),
                            ],
                          );
                        },
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
                                  datePicked =
                                      DateFormat('M, yyyy').format(date);
                                  agendaBloc.add(GetAgendaEvent(
                                      kata: kata,
                                      tanggal: tanggal,
                                      isBerjalan: isBerjalan));
                                }
                              });
                            },
                            child: BlocBuilder<AgendaBloc, AgendaState>(
                              bloc: agendaBloc,
                              builder: (context, state) {
                                return Text(
                                  'Bulan $datePicked',
                                  style: kPoppinsMedium.copyWith(
                                    fontSize: kSize14,
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
                  SizedBox(height: kSize24),
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
                      color: kWhite,
                    ),
                    child: TextField(
                      controller: agendaController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Cari Agenda',
                        hintStyle: kNunitoRegular.copyWith(
                          fontSize: 15,
                          color: kNeutral60,
                        ),
                      ),
                      onChanged: (value) {
                        kata = value;
                        agendaBloc.add(GetAgendaEvent(
                            kata: kata,
                            tanggal: tanggal,
                            isBerjalan: isBerjalan));
                      },
                    ),
                  ),
                  SizedBox(height: kSize24),
                  BlocBuilder(
                    bloc: agendaBloc
                      ..add(GetAgendaEvent(
                          kata: kata,
                          tanggal: tanggal,
                          isBerjalan: isBerjalan)),
                    builder: (context, state) {
                      if (state is AgendaLoading) {
                        return SizedBox(
                          height: SizeConfig.screenHeight! * .6,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is AgendaLoaded) {
                        final List<DataAgenda> dataAgenda = state.agenda.data;
                        // dataAgenda.clear();
                        if (dataAgenda.isNotEmpty) {
                          return SizedBox(
                            height: dataAgenda.length < 5
                                ? SizeConfig.screenHeight! * .6
                                : null,
                            child: Column(
                              children: dataAgenda
                                  .map((e) => ItemAgenda(
                                      namaEvent: e.namaEvent,
                                      unitPengundang: e.unitPengundang,
                                      tanggal: e.tanggal))
                                  .toList(),
                            ),
                          );
                        } else {
                          // Tidak ada data
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/libur-jadwal-perkuliahan.svg'),
                                const SizedBox(height: 24),
                                Text(
                                  'Saat ini tidak ada agenda',
                                  style: kPoppinsSemiBold.copyWith(
                                    fontSize: kSize18,
                                    color: kBlack,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Anda belum memiliki agenda',
                                  textAlign: TextAlign.center,
                                  style: kNunitoRegular.copyWith(
                                    fontSize: kSize14,
                                    color: kNeutral90,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                      return SizedBox(
                        height: SizeConfig.screenHeight! * .6,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () => agendaBloc.add(GetAgendaEvent(
                                kata: kata,
                                tanggal: tanggal,
                                isBerjalan: isBerjalan)),
                            child: const Text("Ulangi"),
                          ),
                        ),
                      );
                    },
                  ),
                ],
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
          MaterialPageRoute(builder: (context) => const DetailAgendaPage()),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaEvent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kPoppinsMedium.copyWith(
                fontSize: kSize14,
                color: kBlack,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dari: ',
                    style: kNunitoRegular.copyWith(
                      fontSize: kSize14,
                      color: kNeutral80,
                    ),
                  ),
                  TextSpan(
                    text: unitPengundang,
                    style: kNunitoRegular.copyWith(
                      fontSize: kSize14,
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
                  fontSize: kSize12,
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
        horizontal: kSize16,
        vertical: kSize8,
      ),
      child: Center(
        child: Text(
          kata,
          style: kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: kSize12,
          ),
        ),
      ),
    );
  }
}
