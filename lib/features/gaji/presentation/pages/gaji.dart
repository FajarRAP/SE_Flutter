import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/gaji_cubit.dart';
import '../widgets/item_gaji.dart';

class GajiPage extends StatelessWidget {
  const GajiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GajiCubit gajiCubit = context.read<GajiCubit>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kWhite,
              centerTitle: true,
              elevation: 4,
              forceElevated: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kBlue,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              shadowColor: const Color(0x25293241).withOpacity(.5),
              title: Text(
                'Informasi Gaji',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 18,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            gajiCubit.getGajis();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: BlocBuilder<GajiCubit, GajiState>(
              bloc: gajiCubit..getGajis(),
              builder: (context, state) {
                // Loading
                if (state is GajiLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Loaded not empty
                if (state is GajiLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemGaji(
                        dataGaji: state.data[index],
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

                // Loaded empty
                if (state is GajiEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        SvgPicture.asset(
                          emptyDataSvg,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Tidak ada gaji',
                          style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: 18,
                            color: kBlack,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Tidak dapat menampilkan daftar gaji',
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

                // Default
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      gajiCubit.getGajis();
                    },
                    child: const Text('Ulangi'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
