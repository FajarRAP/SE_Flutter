import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';

class TextFieldKeterangan extends StatefulWidget {
  const TextFieldKeterangan({
    super.key,
  });

  @override
  State<TextFieldKeterangan> createState() => _TextFieldKeteranganState();
}

class _TextFieldKeteranganState extends State<TextFieldKeterangan> {
  final TextEditingController keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TambahSuntingCutiCubit tambahSuntingCutiCubit =
        context.read<TambahSuntingCutiCubit>();
    keteranganController.text =
        tambahSuntingCutiCubit.dataCutiModel!.keterangan;
    return TextField(
      controller: keteranganController,
      maxLines: 5,
      style: Styles.kNunitoRegular.copyWith(
        fontSize: Screen.kSize16,
        color: kNeutral90,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintStyle: Styles.kNunitoRegular.copyWith(
          fontSize: Screen.kSize16,
          color: kNeutral70,
        ),
        contentPadding: const EdgeInsets.all(0), // Menghilangkan padding
        border: InputBorder.none, // Menghilangkan border
        hintText: 'Masukan alasan cuti',
      ),
      onChanged: (value) {
        tambahSuntingCutiCubit.dataCutiModel!.keterangan = value;
      },
    );
  }

  @override
  void dispose() {
    keteranganController.dispose();
    super.dispose();
  }
}
