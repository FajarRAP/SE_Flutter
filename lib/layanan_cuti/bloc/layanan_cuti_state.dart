part of 'layanan_cuti_bloc.dart';

@immutable
sealed class LayananCutiState {}

final class LayananCutiInitial extends LayananCutiState {}

class LayananCutiLoading extends LayananCutiState {}

class LayananCutiLoaded extends LayananCutiState {
  final KeteranganCuti keteranganCuti;
  final List<CutiTahunan> cutiTahunan;
  LayananCutiLoaded(this.keteranganCuti, this.cutiTahunan);
}
