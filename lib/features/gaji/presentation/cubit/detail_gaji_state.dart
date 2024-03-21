part of 'detail_gaji_cubit.dart';

@immutable
sealed class DetailGajiState {}

final class DetailGajiInitial extends DetailGajiState {}

class DetailGajiLoading extends DetailGajiState {}

class DetailGajiLoaded extends DetailGajiState {
  final List<DataDetailGajiModel> data;

  DetailGajiLoaded(this.data);
}

class DetailGajiError extends DetailGajiState {
  final String message;

  DetailGajiError(this.message);
}
