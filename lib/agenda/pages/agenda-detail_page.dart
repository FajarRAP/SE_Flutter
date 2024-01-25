import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../helper/app_styles.dart';
import '../../../helper/size_config.dart';
import '../bloc/agenda_bloc.dart';
import '../models/agenda-detail_model.dart';

class DetailAgendaPage extends StatelessWidget {
  const DetailAgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AgendaBloc agendaBloc = AgendaBloc()..add(GetAgendaDetailEvent());
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
              // Jarak penyebaran shadow
              blurRadius: 4, // Radius blur shadow
              offset: const Offset(0, -1),
            ) // Posisi shadow (x, y)
          ],
        ),
        padding: EdgeInsets.all(kSize16),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   PageTransition(
            //     duration: const Duration(milliseconds: 100),
            //     child: const MainScanner(),
            //     type: PageTransitionType.fade,
            //   ),
            // );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            fixedSize: Size(SizeConfig.screenWidth!, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Scan Presensi',
            style: kPoppinsMedium.copyWith(
              fontSize: kSize16,
              color: kWhite,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kSize24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSize20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icons/arrow-left.svg'),
                ),
              ),
              SizedBox(height: kSize24),
              BlocBuilder<AgendaBloc, AgendaState>(
                bloc: agendaBloc,
                builder: (context, state) {
                  if (state is AgendaDetailLoading) {
                    return SizedBox(
                      height: SizeConfig.screenHeight! * .7,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is AgendaDetailLoaded) {
                    final AgendaDetail agendaDetail = state.data;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kSize20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: kSize8),
                                width: kSize18,
                                height: kSize18,
                                decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(kSize4),
                                ),
                              ),
                              SizedBox(width: kSize16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      agendaDetail.data.namaEvent,
                                      style: kPoppinsMedium.copyWith(
                                        fontSize: kSize24,
                                        color: kBlack,
                                      ),
                                    ),
                                    SizedBox(height: kSize4),
                                    Text(
                                      agendaDetail.data.tanggal,
                                      style: kNunitoRegular.copyWith(
                                        fontSize: kSize16,
                                        color: kNeutral80,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: kSize32),
                        Container(
                          height: 8,
                          color: const Color(0xFFF6F7F9),
                        ),
                        SizedBox(height: kSize32),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: kSize20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemDetailAgenda(
                                kata: 'Penyelenggara',
                                keterangan: agendaDetail.data.unitPengundang,
                              ),
                              SizedBox(height: kSize24),
                              ItemDetailAgenda(
                                  kata: 'Pukul',
                                  keterangan: agendaDetail.data.jam),
                              SizedBox(height: kSize24),
                              ItemDetailAgenda(
                                  kata: 'Lokasi',
                                  keterangan: agendaDetail.data.lokasi),
                              SizedBox(height: kSize24),
                              ItemDetailAgenda(
                                  kata: 'Peserta',
                                  keterangan: agendaDetail.data.peserta),
                              SizedBox(height: kSize16),
                              const Divider(),
                              SizedBox(height: kSize16),
                              Text(
                                'Deskripsi',
                                style: kPoppinsMedium.copyWith(
                                  fontSize: kSize14,
                                  color: kBlack,
                                ),
                              ),
                              SizedBox(height: kSize8),
                              Text(
                                agendaDetail.data.keterangan,
                                style: kNunitoRegular.copyWith(
                                  fontSize: kSize14,
                                  color: kNeutral80,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    height: SizeConfig.screenHeight! * .7,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () => agendaBloc.add(GetAgendaDetailEvent()),
                        child: const Text("Ulangi"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetailAgenda extends StatelessWidget {
  const ItemDetailAgenda({
    super.key,
    required this.kata,
    required this.keterangan,
  });

  final String kata;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/agenda-$kata.svg',
          width: kSize40,
        ),
        SizedBox(width: kSize16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kata,
                style: kPoppinsRegular.copyWith(
                  fontSize: kSize14,
                  color: kNeutral80,
                ),
              ),
              Text(
                keterangan,
                style: kNunitoSemiBold.copyWith(
                  fontSize: kSize14,
                  color: kBlack,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
