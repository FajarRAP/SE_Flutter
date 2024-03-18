part of 'detail_tunjangan_cubit.dart';

@immutable
sealed class DetailTunjanganState {}

final class DetailTunjanganInitial extends DetailTunjanganState {}

final class DetailTunjanganLoading extends DetailTunjanganState{}

final class DetailTunjanganLoaded extends DetailTunjanganState{}

final class DetailTunjanganEmpty extends DetailTunjanganState{}

final class DetailTunjanganError extends DetailTunjanganState{
  final String message;

  DetailTunjanganError(this.message);
}
