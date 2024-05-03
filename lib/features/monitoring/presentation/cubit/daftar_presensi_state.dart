part of 'daftar_presensi_cubit.dart';

@immutable
sealed class DaftarPresensiState {}

final class DaftarPresensiInitial extends DaftarPresensiState {}

class DaftarPresensiLoading extends DaftarPresensiState {}

class DaftarPresensiLoaded extends DaftarPresensiState {
  final List<DataDaftarPresensi> data;
  
  DaftarPresensiLoaded(this.data);
}

class DaftarPresensiEmpty extends DaftarPresensiState {}

class DaftarPresensiError extends DaftarPresensiState {
  final String errorMsg;

  DaftarPresensiError(this.errorMsg);
}
