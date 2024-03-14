import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/tunjangan_cubit.dart';
import '../widgets/item_tunjangan.dart';

class TunjanganBerasPage extends StatelessWidget {
  const TunjanganBerasPage({
    super.key,
  });

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
                  width: 24,
                  height: 24,
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
          displacement: 10,
          onRefresh: () async {
            tunjanganCubit.getTunjangans();
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              color: bgColor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
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
                          tunjanganCubit.datePicked =
                              DateFormat('M, yyyy').format(date);
                          tunjanganCubit.getTunjangans();
                        }
                      },
                      child: BlocBuilder<TunjanganCubit, TunjanganState>(
                        builder: (context, state) {
                          return Text(
                            'Bulan ${tunjanganCubit.datePicked}',
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
                      if (state is TunjanganLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is TunjanganLoaded) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return ItemTunjangan(
                              dataTunjangan: state.data[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: state.data.length,
                        );
                      }

                      if (state is TunjanganEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                emptyDataSvg,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Tidak Ada Tunjangan',
                                style: Styles.kPoppinsSemiBold.copyWith(
                                  fontSize: 18,
                                  color: kBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Tidak ada data tunjangan untuk ditampilkan',
                                textAlign: TextAlign.center,
                                style: Styles.kNunitoRegular.copyWith(
                                  fontSize: 14,
                                  color: kNeutral90,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            tunjanganCubit.getTunjangans();
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
