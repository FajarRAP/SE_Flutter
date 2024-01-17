part of 'layanan_cuti_bloc.dart';

@immutable
sealed class LayananCutiEvent {}

class GetKeteranganCutiEvent extends LayananCutiEvent {}

class GetCutiTahunanEvent extends LayananCutiEvent {}

class GetLayananCutiEvent extends LayananCutiEvent {}
