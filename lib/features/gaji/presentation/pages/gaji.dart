
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/gaji_cubit.dart';
import '../widgets/gaji_kosong.dart';
import '../widgets/item_gaji.dart';

class Gaji extends StatefulWidget {
  const Gaji({super.key});

  @override
  State<Gaji> createState() => _GajiState();
}

class _GajiState extends State<Gaji> {
  @override
  Widget build(BuildContext context) {
    final GajiCubit gajiCubit = context.read<GajiCubit>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Informasi Gaji',
            style: Styles.kPoppinsMedium.copyWith(
              fontSize: Screen.kSize16,
              color: kBlack,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: () async {
          gajiCubit.getGaji();
        },
        child: BlocBuilder<GajiCubit, GajiState>(
          bloc: gajiCubit..getGaji(),
          builder: (context, state) {
            if (state is GajiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GajiLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Screen.kSize20, vertical: Screen.kSize16),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: Screen.kSize12);
                  },
                  itemCount: gajiCubit.gaji!.data.length,
                  itemBuilder: (context, index) {
                    return ItemGaji(
                      dataGaji: gajiCubit.gaji!.data[index],
                    );
                  },
                ),
              );
            } else if (state is GajiEmpty) {
              return const GajiKosong();
            } else {
              return Container(
                height: Screen.height,
                color: const Color((0xFFF6F7F9)),
              );
            }
          },
        ),
      ),
    );
  }
}
