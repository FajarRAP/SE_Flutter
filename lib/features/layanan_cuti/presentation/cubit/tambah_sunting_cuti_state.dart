part of 'tambah_sunting_cuti_cubit.dart';

@immutable
sealed class TambahSuntingCutiState {}

final class TambahSuntingCutiInitial extends TambahSuntingCutiState {}

class DatePicked extends TambahSuntingCutiState {}
