part of 'shift_berikutnya_cubit.dart';

@immutable
sealed class ShiftBerikutnyaState {}

final class ShiftBerikutnyaInitial extends ShiftBerikutnyaState {}

class ShiftBerikutnyaLoading extends ShiftBerikutnyaState {}

class ShiftBerikutnyaLoaded extends ShiftBerikutnyaState {
  final List<DataShiftBerikutnya> data;

  ShiftBerikutnyaLoaded(this.data);
}

class ShiftBerikutnyaEmpty extends ShiftBerikutnyaState {}

class ShiftBerikutnyaError extends ShiftBerikutnyaState {
  final String errorMsg;

  ShiftBerikutnyaError(this.errorMsg);
}

