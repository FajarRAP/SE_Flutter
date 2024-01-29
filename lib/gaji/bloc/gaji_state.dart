part of 'gaji_bloc.dart';

@immutable
sealed class GajiState {}

final class GajiInitial extends GajiState {}

//GAJI STATE
class GajiLoading extends GajiState{}
class GajiLoaded extends GajiState{
  final Gaji data;

  GajiLoaded(this.data);
}
class GajiError extends GajiState{
  final String errorMsg;

  GajiError(this.errorMsg);
}


//DETAIL GAJI
class DetailGajiLoading extends GajiState{}
class DetailGajiLoaded extends GajiState{
  final DetailGaji data;

  DetailGajiLoaded(this.data);
}
class DetailGajiError extends GajiState{
  final String errorMsg;

  DetailGajiError(this.errorMsg);
}


