part of 'layanan_cuti_bloc.dart';

@immutable
sealed class LayananCutiEvent {}

class GetLayananCutiEvent extends LayananCutiEvent {
  final bool isBerjalan;

  GetLayananCutiEvent({this.isBerjalan = true});
}
