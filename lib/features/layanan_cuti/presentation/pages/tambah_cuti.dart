import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../utils/cuti_constant_finals.dart';
import '../../utils/cuti_functions.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';
import '../widgets/container_designed.dart';
import '../widgets/date_picker_cuti.dart';
import '../widgets/text_field_keterangan.dart';

class TambahCutiPage extends StatelessWidget {
  const TambahCutiPage({
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
            )
          ];
        },
        body: Column(
          children: [
            // Section Atas
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Tambah Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              color: const Color(0xFFF0F1F3),
              height: 8,
            ),
            const SizedBox(
              height: 32,
            ),

            // Section Bawah
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  // Mulai Cuti
                  BlocBuilder<TambahSuntingCutiCubit, TambahSuntingCutiState>(
                    bloc: tambahSuntingCutiCubit,
                    builder: (context, state) {
                      return ContainerDesigned(
                        widget: DatePickerCuti(
                          pesan: tambahSuntingCutiCubit.getTglMulai,
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Selesai Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  // Selesai Cuti
                  BlocBuilder<TambahSuntingCutiCubit, TambahSuntingCutiState>(
                    bloc: tambahSuntingCutiCubit,
                    builder: (context, state) {
                      return ContainerDesigned(
                        widget: DatePickerCuti(
                          pesan: tambahSuntingCutiCubit.getTglSelesai,
                          isMulai: false,
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Keterangan Cuti',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
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
              color: Colors.grey.withOpacity(0.5),
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
              'Berhasil Tambah',
              'Berhasil Menambah cuti',
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
            'Tambah Cuti',
            style: Styles.kPoppinsMedium.copyWith(
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
