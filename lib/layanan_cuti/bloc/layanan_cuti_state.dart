part of 'layanan_cuti_bloc.dart';

@immutable
sealed class LayananCutiState {}

final class LayananCutiInitial extends LayananCutiState {}

class LayananCutiLoading extends LayananCutiState {}

class LayananCutiLoaded extends LayananCutiState {
  final CutiRekap cutiRekap;
  final CutiDaftar cutiDaftar;
  final bool isBerjalan;

  LayananCutiLoaded({
    required this.cutiRekap,
    required this.cutiDaftar,
    required this.isBerjalan
  });
}