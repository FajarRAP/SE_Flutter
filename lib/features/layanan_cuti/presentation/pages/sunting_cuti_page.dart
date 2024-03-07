import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';
import '../widgets/container_designed.dart';
import '../widgets/date_picker_cuti.dart';
import '../widgets/text_field_keterangan.dart';

class SuntingCutiPage extends StatelessWidget {
  const SuntingCutiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TambahSuntingCutiCubit tambahSuntingCutiCubit =
        context.read<TambahSuntingCutiCubit>();

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
            ),
          ];
        },
        body: Column(
          children: [
            // Section Atas
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
              ),
              child: Row(
                children: [
                  Container(
                    width: Screen.kSize18,
                    height: Screen.kSize18,
                    decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius:
                            BorderRadiusDirectional.circular(Screen.kSize4)),
                  ),
                  SizedBox(
                    width: Screen.kSize16,
                  ),
                  Text(
                    'Sunting Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      fontSize: Screen.kSize24,
                      color: kBlack,
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

            // Section Bawah
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: Screen.kSize14,
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize8,
                  ),

                  // Mulai Cuti
                  BlocBuilder<TambahSuntingCutiCubit, TambahSuntingCutiState>(
                    bloc: tambahSuntingCutiCubit,
                    builder: (context, state) {
                      return ContainerDesigned(
                        widget: DatePickerCuti(
                          pesan: tambahSuntingCutiCubit
                              .dataCutiModel!.tanggalMulai,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Text(
                    'Selesai Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: Screen.kSize14,
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize8,
                  ),

                  // Selesai Cuti
                  BlocBuilder<TambahSuntingCutiCubit, TambahSuntingCutiState>(
                    bloc: tambahSuntingCutiCubit,
                    builder: (context, state) {
                      return ContainerDesigned(
                        widget: DatePickerCuti(
                          pesan: tambahSuntingCutiCubit
                              .dataCutiModel!.tanggalSelesai,
                          isMulai: false,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Text(
                    'Keterangan Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: Screen.kSize14,
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize8,
                  ),

                  // Keterangan
                  const ContainerDesigned(
                    widget: TextFieldKeterangan(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5), // Warna dan opasitas shadow
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
              'Berhasil Sunting',
              'Cuti Berhasil Disunting',
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
            'Sunting Cuti',
            style: Styles.kPoppinsMedium.copyWith(
              fontSize: Screen.kSize16,
              color: kWhite,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
