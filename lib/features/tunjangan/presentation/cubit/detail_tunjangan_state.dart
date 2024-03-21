part of 'detail_tunjangan_cubit.dart';

@immutable
sealed class DetailTunjanganState {}

final class DetailTunjanganInitial extends DetailTunjanganState {}

class DetailTunjanganLoading extends DetailTunjanganState {}

class DetailTunjanganLoaded extends DetailTunjanganState {
  final DataDetailTunjanganModel data;

  DetailTunjanganLoaded(this.data);
}

class DetailTunjanganError extends DetailTunjanganState {
  final String message;

  DetailTunjanganError(this.message);
}
