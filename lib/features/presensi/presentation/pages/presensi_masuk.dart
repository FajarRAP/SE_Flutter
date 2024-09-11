import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const_final_presensi.dart';
import '../cubit/presensi_cubit.dart';
import '../cubit/shift_berikutnya_cubit.dart';
import '../widgets/card_location.dart';
import '../widgets/card_masuk.dart';
import '../widgets/card_pulang.dart';
import '../widgets/item_next_shift.dart';
import '../widgets/shift_empty.dart';
import 'presensi_kamera.dart';

class PresensiMasukPage extends StatefulWidget {
  final String? imagePath;
  const PresensiMasukPage({Key? key, this.imagePath}) : super(key: key);

  @override
  State<PresensiMasukPage> createState() => _PresensiMasukPageState();
}

class _PresensiMasukPageState extends State<PresensiMasukPage> {
  String? imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath; 
  }

  @override
  Widget build(BuildContext context) {
    final ShiftBerikutnyaCubit shiftBerikutnyaCubit =
        context.read<ShiftBerikutnyaCubit>();
    final PresensiCubit presensiCubit = context.read<PresensiCubit>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              title: Text(
                'Presensi Hari Ini',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
              leading: const SizedBox(),
            ),
          ];
        },
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
            color: Color(0xFFF6F7F9),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: Column(
            children: [
              BlocBuilder<PresensiCubit, PresensiState>(
                bloc: presensiCubit..getDetilPresensis(),
                builder: (context, state) {
                  if (state is DetilPresensiLoading) {
                    return const Center();
                  } else if (state is DetilPresensiLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CardLocation(data: state.data),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: CardMasuk(data: state.data),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CardPulang(data: state.data),
                              ),
                            ],
                          ),
                        ),
                        imagePath == null
                            ? const SizedBox(child: Text("Ini Gambar"))
                            : Image.file(File(imagePath!), width: 200, height: 200),
                        const SizedBox(height: 24),
                        Container(
                          height: 8,
                          color: const Color(0xFFEEF2F3),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Shift berikutnya',
                            style: Styles.kPoppinsMedium.copyWith(
                              color: kNeutral70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
                  } else if (state is DetilPresensiError) {
                    return const Center();
                  }
                  return const Center();
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<ShiftBerikutnyaCubit, ShiftBerikutnyaState>(
                    bloc: shiftBerikutnyaCubit..getShiftBerikutnyas(),
                    builder: (context, state) {
                      if (state is ShiftBerikutnyaLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ShiftBerikutnyaLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => ItemNextShift(dataShift: state.data[index]),
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemCount: state.data.length,
                        );
                      } else if (state is ShiftBerikutnyaEmpty) {
                        return const ShiftEmpty();
                      } else if (state is ShiftBerikutnyaError) {
                        return const Center(child: Text('Ada Yang Salah'));
                      }
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            shiftBerikutnyaCubit.getShiftBerikutnyas();
                          },
                          child: const Text('Ulang'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final imagePath = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PresensiCamera(),
              ),
            );

            if (imagePath != null) {
              setState(() {
                this.imagePath = imagePath; // Set imagePath di dalam state
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            fixedSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Presensi Masuk',
            style: Styles.kPoppinsMedium.copyWith(
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
