part of 'gaji_cubit.dart';

@immutable
sealed class GajiState {}

final class GajiInitial extends GajiState {}

class GajiLoading extends GajiState {}

class GajiLoaded extends GajiState {}

class GajiEmpty extends GajiState {}

class GajiError extends GajiState {
  final String message;

  GajiError(this.message);
}
