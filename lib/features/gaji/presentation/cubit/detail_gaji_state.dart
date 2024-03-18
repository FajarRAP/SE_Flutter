part of 'detail_gaji_cubit.dart';

@immutable
sealed class DetailGajiState {}

final class DetailGajiInitial extends DetailGajiState {}

final class DetailGajiLoading extends DetailGajiState {}

final class DetailGajiLoaded extends DetailGajiState {
  final List<DataDetailGaji> data;

  DetailGajiLoaded(this.data);
}

final class DetailGajiEmpty extends DetailGajiState {}

final class DetailGajiError extends DetailGajiState {
  final String message;

  DetailGajiError(this.message);
}
