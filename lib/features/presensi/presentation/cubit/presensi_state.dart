part of 'presensi_cubit.dart';

@immutable
sealed class PresensiState {}

final class PresensiInitial extends PresensiState {}

class RekapPresensi extends PresensiState {}

class TodayPresensi extends PresensiState {}

class DaftarPresensi extends PresensiState {}

class RekapPresensiLoading extends RekapPresensi {}

class RekapPresensiLoaded extends RekapPresensi {
  final DataRekapPresensi data;
  RekapPresensiLoaded(this.data);
}

class RekapPresensiError extends RekapPresensi {
  final String message;

  RekapPresensiError(this.message);
}

class TodayPresensiLoading extends TodayPresensi {}

class TodayPresensiLoaded extends TodayPresensi {
  final DataTodayPresensiModel data;

  TodayPresensiLoaded(this.data);
}

class TodayPresensiError extends TodayPresensi {
  final String message;

  TodayPresensiError(this.message);
}

class DaftarPresensiLoading extends DaftarPresensi {}

class DaftarPresensiLoaded extends DaftarPresensi {
  final List<DataPresensi> data;

  DaftarPresensiLoaded(this.data);
}

class DaftarPresensiError extends DaftarPresensi {
  final String message;

  DaftarPresensiError(this.message);
}
