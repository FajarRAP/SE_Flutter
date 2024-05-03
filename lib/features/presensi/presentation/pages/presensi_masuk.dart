import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/shift_berikutnya_cubit.dart';
import '../widgets/card_location.dart';
import '../widgets/card_masuk.dart';
import '../widgets/card_pulang.dart';
import '../widgets/item_next_shift.dart';
import '../widgets/shift_empty.dart';
import '../widgets/success_dialog.dart';

class PresensiMasukPage extends StatelessWidget {
  const PresensiMasukPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShiftBerikutnyaCubit shiftBerikutnyaCubit =
        context.read<ShiftBerikutnyaCubit>();

    // bool showAll = false;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lokasi
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: CardLocation(),
              ),

              const SizedBox(height: 16),

              // Masuk and Pulang
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    // Masuk
                    Expanded(
                      child: CardMasuk(),
                    ),
                    SizedBox(width: 16),
                    // Pulang
                    Expanded(
                      child: CardPulang(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Container(
                height: 8,
                color: const Color(0xFFEEF2F3),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Shift berikutnya',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kNeutral70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  // List Next Shift
                  child:
                      BlocBuilder<ShiftBerikutnyaCubit, ShiftBerikutnyaState>(
                    bloc: shiftBerikutnyaCubit..getShiftBerikutnyas(),
                    builder: (context, state) {
                      if (state is ShiftBerikutnyaLoading) {
                        return Center();
                      } else if (state is ShiftBerikutnyaLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) =>
                              ItemNextShift(
                                dataShift: state.data[index],
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: state.data.length,
                        );
                      } else if (state is ShiftBerikutnyaEmpty) {
                        return const ShiftEmpty();
                      } else if (state is ShiftBerikutnyaError) {
                        return const Center(
                          child: Text('Ada Yang Salah'),
                        );
                      }
                      return Center();
                    },
                  ),
                ),
              ),

              // TextButton(
              //   onPressed: () => setState(() => showAll = !showAll),
              //   child: Text(
              //     'Lorem',
              //     style: Styles.kPoppinsMedium.copyWith(
              //       color: kBlue,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
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
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => presensiMasuk(context),
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

