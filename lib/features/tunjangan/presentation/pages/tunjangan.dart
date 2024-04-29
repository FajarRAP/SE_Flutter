import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/tunjangan_cubit.dart';
import '../widgets/item_tunjangan.dart';
import '../widgets/tunjangan_not_exist.dart';

class TunjanganBerasPage extends StatelessWidget {
  const TunjanganBerasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TunjanganCubit tunjanganCubit = context.read<TunjanganCubit>();

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
                'Tunjangan Beras',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          backgroundColor: kWhite,
          color: kBlue,
          onRefresh: () async {
            tunjanganCubit.getTunjangans();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 32,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              color: bgColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        final DateTime? date = await ourMonthPicker(context);
                        if (date != null) {
                          //WILL DO
                          tunjanganCubit.setTanggal = date;
                          tunjanganCubit.setDatePicked = date;
                          tunjanganCubit.getTunjangans();
                        }
                      },
                      child: BlocBuilder<TunjanganCubit, TunjanganState>(
                        bloc: tunjanganCubit,
                        builder: (context, state) {
                          return Text(
                            'Bulan ${tunjanganCubit.getDatePicked}',
                            style: Styles.kPoppinsMedium.copyWith(
                              fontSize: 14,
                              color: kNeutral80,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<TunjanganCubit, TunjanganState>(
                    bloc: tunjanganCubit..getTunjangans(),
                    builder: (context, state) {
                      // Loading
                      if (state is TunjanganLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Loaded
                      if (state is TunjanganLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ItemTunjangan(
                              dataTunjangan: state.data[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          itemCount: state.data.length,
                        );
                      }

                      // Empty
                      if (state is TunjanganEmpty) {
                        return const TunjanganNotExist();
                      }

                      // Default
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {},
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
      resizeToAvoidBottomInset: false,
    );
  }
}
