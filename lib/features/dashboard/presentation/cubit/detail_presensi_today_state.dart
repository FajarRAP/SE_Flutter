part of 'detail_presensi_today_cubit.dart';

@immutable
sealed class DetailPresensiTodayState {}

final class DetailPresensiTodayInitial extends DetailPresensiTodayState {}

class DetailPresensiTodayLoading extends DetailPresensiTodayState {}

class DetailPresensiTodayLoaded extends DetailPresensiTodayState {
  final Data data;
  DetailPresensiTodayLoaded(this.data);
}

class DetailPresensiTodayError extends DetailPresensiTodayState {
  final String message;

  DetailPresensiTodayError(this.message);
}
