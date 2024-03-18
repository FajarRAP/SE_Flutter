part of 'gaji_cubit.dart';

@immutable
sealed class GajiState {}

final class GajiInitial extends GajiState {}

// Gaji
final class GajiLoading extends GajiState{}

final class GajiLoaded extends GajiState{}

final class GajiEmpty extends GajiState{}

final class GajiError extends GajiState{
  final String message;
  GajiError(this.message);
}



