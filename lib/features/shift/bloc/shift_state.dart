part of 'shift_bloc.dart';

@immutable
sealed class ShiftState {}

final class ShiftInitial extends ShiftState {}

//state untuk mendapatkan semua data shift
class JadwalShiftLoading extends ShiftState{}

class JadwalShiftLoaded extends ShiftState{
  final JadwalShiftKerja data;
  JadwalShiftLoaded(this.data);
}

class JadwalShiftError extends ShiftState{
  final String errorMsg;
  JadwalShiftError(this.errorMsg);
}
