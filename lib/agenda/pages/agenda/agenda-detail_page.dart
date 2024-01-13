import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/agenda/agenda_bloc.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../../models/agenda/agenda-detail_model.dart';
class DetailAgenda extends StatelessWidget {
  const DetailAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    final AgendaBloc agendaBloc = AgendaBloc()..add(GetAgendaDetailEvent());
    SizeConfig().init(context);
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
        padding: EdgeInsets.all(
          SizeConfig.blockSizeHorizontal! * 3.75,
        ),
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
              fontSize: SizeConfig.blockSizeHorizontal! * 3.75,
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
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                  // child: SvgPicture.asset('assets/icons/arrow-left.svg'),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              BlocBuilder<AgendaBloc, AgendaState>(
                bloc: agendaBloc,
                builder: (context, state) {
                  print(state);
                  if (state is AgendaDetailLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AgendaDetailLoaded) {
                    final AgendaDetail agendaDetail = state.data;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.blockSizeHorizontal! * 1.87,
                                ),
                                width: SizeConfig.blockSizeHorizontal! * 4.25,
                                height: SizeConfig.blockSizeHorizontal! * 4.25,
                                decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                    SizeConfig.blockSizeHorizontal! * 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      agendaDetail.data.namaEvent,
                                      style: kPoppinsMedium.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                5.5,
                                        color: kBlack,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeHorizontal! * 1,
                                    ),
                                    Text(
                                      agendaDetail.data.tanggal,
                                      style: kNunitoRegular.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.75,
                                        color: kNeutral80,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 7.5,
                        ),
                        Container(
                          height: 8,
                          color: const Color(0xFFF6F7F9),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 7.5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/icons/agenda-penyelenggara.svg',
                                  //   width: SizeConfig.blockSizeHorizontal! * 9.35,
                                  // ),
                                  SizedBox(
                                    width:
                                        SizeConfig.blockSizeHorizontal! * 3.75,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Penyelenggara',
                                          style: kPoppinsRegular.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.25,
                                            color: kNeutral80,
                                          ),
                                        ),
                                        Text(
                                          agendaDetail.data.unitPengundang,
                                          style: kNunitoSemiBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.75,
                                            color: kBlack,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 5.5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/icons/agenda-pukul.svg',
                                  //   width: SizeConfig.blockSizeHorizontal! * 9.35,
                                  // ),
                                  SizedBox(
                                    width:
                                        SizeConfig.blockSizeHorizontal! * 3.75,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pukul',
                                        style: kPoppinsRegular.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3.25,
                                          color: kNeutral80,
                                        ),
                                      ),
                                      Text(
                                        agendaDetail.data.jam,
                                        style: kNunitoSemiBold.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3.75,
                                          color: kBlack,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 5.5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/icons/agenda-lokasi.svg',
                                  //   width: SizeConfig.blockSizeHorizontal! * 9.35,
                                  // ),
                                  SizedBox(
                                    width:
                                        SizeConfig.blockSizeHorizontal! * 3.75,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lokasi',
                                          style: kPoppinsRegular.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.25,
                                            color: kNeutral80,
                                          ),
                                        ),
                                        Text(
                                          agendaDetail.data.lokasi,
                                          style: kNunitoSemiBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.75,
                                            color: kBlack,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 5.5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/icons/agenda-peserta.svg',
                                  //   width: SizeConfig.blockSizeHorizontal! * 9.35,
                                  // ),
                                  SizedBox(
                                    width:
                                        SizeConfig.blockSizeHorizontal! * 3.75,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Peserta',
                                          style: kPoppinsRegular.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.25,
                                            color: kNeutral80,
                                          ),
                                        ),
                                        Text(
                                          agendaDetail.data.peserta,
                                          style: kNunitoSemiBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.75,
                                            color: kBlack,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              const Divider(),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              Text(
                                'Deskripsi',
                                style: kPoppinsMedium.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.25,
                                  color: kBlack,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              Text(
                                agendaDetail.data.keterangan,
                                style: kNunitoRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.25,
                                  color: kNeutral80,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * .15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return const Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
