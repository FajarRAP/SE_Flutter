import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/detail_agenda_cubit.dart';
import '../widgets/item_detail_agenda.dart';

class DetailAgendaPage extends StatelessWidget {
  const DetailAgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailAgendaCubit detailAgendaCubit =
        context.read<DetailAgendaCubit>();

    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: bgColor,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          ];
        },
        body: BlocBuilder<DetailAgendaCubit, DetailAgendaState>(
          bloc: detailAgendaCubit..getDetailAgenda(),
          builder: (context, state) {
            if (state is DetailAgendaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is DetailAgendaLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Screen.kSize20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: Screen.kSize8,
                          ),
                          width: Screen.kSize18,
                          height: Screen.kSize18,
                          decoration: BoxDecoration(
                            color: kBlue,
                            borderRadius: BorderRadiusDirectional.circular(
                              Screen.kSize4,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Screen.kSize16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detailAgendaCubit.detailAgenda!.data.namaEvent,
                                style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize24,
                                  color: kBlack,
                                ),
                              ),
                              SizedBox(
                                height: Screen.kSize4,
                              ),
                              Text(
                                detailAgendaCubit.detailAgenda!.data.tanggal,
                                style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize16,
                                  color: kNeutral80,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Container(
                    height: Screen.kSize8,
                    color: const Color(0xFFF0F1F3),
                  ),
                  SizedBox(
                    height: Screen.kSize32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Screen.kSize20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemDetailAgenda(
                          kata: 'Penyelenggara',
                          keterangan: detailAgendaCubit
                              .detailAgenda!.data.unitPengundang,
                        ),
                        SizedBox(height: Screen.kSize24),
                        ItemDetailAgenda(
                          kata: 'Pukul',
                          keterangan: detailAgendaCubit.detailAgenda!.data.jam,
                        ),
                        SizedBox(height: Screen.kSize24),
                        ItemDetailAgenda(
                          kata: 'Lokasi',
                          keterangan:
                              detailAgendaCubit.detailAgenda!.data.lokasi,
                        ),
                        SizedBox(height: Screen.kSize24),
                        ItemDetailAgenda(
                          kata: 'Peserta',
                          keterangan:
                              detailAgendaCubit.detailAgenda!.data.peserta,
                        ),
                        SizedBox(height: Screen.kSize16),
                        const Divider(),
                        SizedBox(height: Screen.kSize16),
                        Text(
                          'Deskripsi',
                          style: Styles.kPoppinsMedium.copyWith(
                            fontSize: Screen.kSize14,
                            color: kBlack,
                          ),
                        ),
                        SizedBox(height: Screen.kSize8),
                        Text(
                          detailAgendaCubit.detailAgenda!.data.keterangan,
                          style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14,
                            color: kNeutral80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: ElevatedButton(
                onPressed: () {
                  detailAgendaCubit.getDetailAgenda();
                },
                child: const Text('Ulangi'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<DetailAgendaCubit, DetailAgendaState>(
        bloc: detailAgendaCubit,
        builder: (context, state) {
          if (state is DetailAgendaLoaded) {
            return Container(
              decoration: BoxDecoration(
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(.5), // Warna dan opasitas shadow
                    // Jarak penyebaran shadow
                    blurRadius: 4, // Radius blur shadow
                    offset: const Offset(0, -1),
                  ) // Posisi shadow (x, y)
                ],
              ),
              padding: EdgeInsets.all(
                Screen.kSize16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  successDialog(
                    context,
                    'Berhasil Presensi',
                    'Terimakasih Telah Melakukan Presensi',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                  fixedSize: Size(
                    Screen.width,
                    Screen.kSize40 + Screen.kSize10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Screen.kSize10,
                    ),
                  ),
                ),
                child: Text(
                  'Scan Presensi',
                  style: Styles.kPoppinsMedium.copyWith(
                    fontSize: Screen.kSize16,
                    color: kWhite,
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
