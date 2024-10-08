import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/shift_constant_finals.dart';
import '../cubit/shift_cubit.dart';
import '../widgets/button_shift.dart';
import '../widgets/item_shift.dart';
import '../widgets/profile.dart';
import '../widgets/shift_not_exist.dart';

class JadwalShiftPage extends StatelessWidget {
  const JadwalShiftPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ShiftCubit shiftCubit = context.read<ShiftCubit>();

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
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kWhite,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              title: Text(
                'Jadwal Shift',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            shiftCubit.getShifts();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profil
                const Profile(),

                const SizedBox(height: 18),

                // Button Hari
                SizedBox(
                  height: 32,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          shiftCubit.clickDay(index);
                          shiftCubit.getShifts();
                        },
                        child: BlocBuilder<ShiftCubit, ShiftState>(
                          builder: (context, state) {
                            return ButtonShift(
                              day: days[index],
                              current: index,
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemCount: days.length,
                  ),
                ),

                // Item Shift
                Expanded(
                  child: BlocBuilder<ShiftCubit, ShiftState>(
                    bloc: shiftCubit..getShifts(),
                    builder: (context, state) {
                      // Loading
                      if (state is ShiftLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Loaded
                      if (state is ShiftLoaded) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ItemShift(
                                dataShift: state.dataShift[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 12);
                            },
                            itemCount: state.dataShift.length,
                          ),
                        );
                      }

                      // Empty
                      if (state is ShiftEmpty) {
                        return const ShiftNotExist();
                      }

                      // Default
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            shiftCubit.getShifts();
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
    );
  }
}

