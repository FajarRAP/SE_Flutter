import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/tunjangan_cubit.dart';
import '../widgets/item_tunjangan.dart';
import '../widgets/tunjangan_kosong.dart';

class Tunjangan extends StatelessWidget {
  const Tunjangan({super.key});

  @override
  Widget build(BuildContext context) {
    //variabel untuk waktu
    String selectedDate = "";
    String tanggal = DateFormat('M, yyyy').format(DateTime.now());
    final TunjanganCubit tunjanganCubit = context.read<TunjanganCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: () async {
          tunjanganCubit.getTunjangan(selectedDate);
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize14,
                vertical: Screen.kSize24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow-left.svg',
                      color: kWhite,
                      fit: BoxFit.scaleDown,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Text(
                    'Tunjangan Beras',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(color: kWhite, fontSize: Screen.kSize20),
                  ),
                  SizedBox(
                    width: Screen.kSize24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: Screen.width,
                padding: EdgeInsets.fromLTRB(Screen.kSize20, Screen.kSize11,
                    Screen.kSize20, Screen.kSize2),
                decoration: const BoxDecoration(
                    color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            showMonthPicker(
                              context: context,
                              headerColor: kBlue,
                              headerTextColor: kWhite,
                              selectedMonthBackgroundColor: kBlue,
                              unselectedMonthTextColor: kBlue,
                              roundedCornersRadius: 12,
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
                              initialDate: DateTime.now(),
                            ).then(
                              (date) {
                                if (date != null) {
                                  //WILL DO
                                  selectedDate =
                                      DateFormat('dd MM y').format(date);
                                  tanggal = DateFormat('M, yyyy').format(date);
                                  tunjanganCubit.getTunjangan(selectedDate);
                                }
                              },
                            );
                          },
                          child: BlocBuilder<TunjanganCubit, TunjanganState>(
                            bloc: tunjanganCubit,
                            builder: (context, state) {
                              return Text(
                                'Bulan $tanggal',
                                style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize14,
                                  color: kNeutral80,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<TunjanganCubit, TunjanganState>(
                      bloc: tunjanganCubit..getTunjangan(selectedDate),
                      builder: (context, state) {
                        print(state);
                        if (state is TunjanganLoading) {
                          return const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is TunjanganLoaded) {
                          return Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: Screen.kSize12);
                              },
                              itemCount: tunjanganCubit.tunjangan!.data.length,
                              itemBuilder: (context, index) {
                                return ItemTunjangan(
                                  dataTunjangan:
                                      tunjanganCubit.tunjangan!.data[index],
                                );
                              },
                            ),
                          );
                        } else if (state is TunjanganEmpty) {
                          return const TunjanganKosong();
                        } else if (state is TunjanganError) {
                          return const Center();
                        } else {
                          return const Center(
                            child: Text('Unknown state'),
                          );
                        }
                      },
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
