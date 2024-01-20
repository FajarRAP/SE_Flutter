part of 'gaji_bloc.dart';

@immutable
sealed class GajiState {}

final class GajiInitial extends GajiState {}

class GajiLoading extends GajiState{}

class GajiLoaded extends GajiState{
  final List<Gaji> data;

  GajiLoaded(this.data);
}

class GajiError extends GajiState{
  final String errorMsg;

  GajiError(this.errorMsg);
}
