part of 'gaji_bloc.dart';

@immutable
sealed class GajiEvent {}

class GetGajiEvent extends GajiEvent{}

class GetDetailGajiEvent extends GajiEvent{}

