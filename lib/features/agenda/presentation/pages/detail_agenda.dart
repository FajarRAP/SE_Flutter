import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

import '../../../../core/functions.dart';
import '../cubit/detail_agenda_cubit.dart';
import '../widgets/item_detail_agenda.dart';
import '../widgets/nama_dan_tanggal.dart';

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
            // Loading
            if (state is DetailAgendaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Loaded
            if (state is DetailAgendaLoaded) {
              return Column(
                children: [
                  // Nama dan Tanggal
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NamaDanTanggal(
                      nama: state.data.namaEvent,
                      tanggal: state.data.tanggal,
                    ),
                  ),

                  // Pembatas
                  const SizedBox(height: 24),
                  Container(
                    height: 8,
                    color: const Color(0xFFF0F1F3),
                  ),
                  const SizedBox(height: 32),

                  // Item Detail Agenda
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemDetailAgenda(
                          kata: 'Penyelenggara',
                          keterangan: state.data.unitPengundang,
                        ),
                        const SizedBox(height: 24),
                        ItemDetailAgenda(
                          kata: 'Pukul',
                          keterangan: state.data.jam,
                        ),
                        const SizedBox(height: 24),
                        ItemDetailAgenda(
                          kata: 'Lokasi',
                          keterangan: state.data.lokasi,
                        ),
                        const SizedBox(height: 24),
                        ItemDetailAgenda(
                          kata: 'Peserta',
                          keterangan: state.data.peserta,
                        ),
                        const SizedBox(height: 16),
                        Divider(
                          color: kGrey.withOpacity(20/100),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Deskripsi',
                          style: Styles.kPoppinsMedium.copyWith(
                            fontSize: 14,
                            color: kBlack,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.data.keterangan,
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral80,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // Default
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
          // Button harus muncul jika dan hanya jika dalam Loaded state
          if (state is DetailAgendaLoaded) {
            return Container(
              decoration: BoxDecoration(
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 4,
                    offset: const Offset(0, -1),
                  )
                ],
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
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
                  fixedSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Scan Presensi',
                  style: Styles.kPoppinsMedium.copyWith(
                    fontSize: 16,
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
