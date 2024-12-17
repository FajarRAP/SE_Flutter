import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/cuti_constant_finals.dart';
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
    keteranganController.text = tambahSuntingCutiCubit.getKeterangan;

    return TextField(
      controller: keteranganController,
      maxLines: 5,
      style: Styles.kNunitoRegular.copyWith(
        color: kNeutral90,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(0),
        hintStyle: Styles.kNunitoRegular.copyWith(
          fontSize: 16,
          color: kNeutral70,
        ),
        hintText: 'Masukan alasan cuti',
        isDense: true,
      ),
      onChanged: (value) {
        tambahSuntingCutiCubit.setKeterangan = value;
      },
    );
  }

  @override
  void dispose() {
    keteranganController.dispose();
    super.dispose();
  }
}
