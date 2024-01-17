part of 'layanan_cuti_bloc.dart';

@immutable
sealed class LayananCutiState {}

final class LayananCutiInitial extends LayananCutiState {}

class KeteranganCutiLoading extends LayananCutiState {}

class KeteranganCutiLoaded extends LayananCutiState {
  final KeteranganCuti data;
  KeteranganCutiLoaded(this.data);
}

class CutiTahunanLoading extends LayananCutiState {}

class CutiTahunanLoaded extends LayananCutiState {
  final List<CutiTahunan> data;
  CutiTahunanLoaded(this.data);
}

class LayananCutiLoading extends LayananCutiState {}

class LayananCutiLoaded extends LayananCutiState {
  final KeteranganCuti keteranganCuti;
  final List<CutiTahunan> cutiTahunan;
  LayananCutiLoaded(this.keteranganCuti, this.cutiTahunan);
}
