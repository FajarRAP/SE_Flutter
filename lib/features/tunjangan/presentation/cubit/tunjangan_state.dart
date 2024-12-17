part of 'tunjangan_cubit.dart';

@immutable
sealed class TunjanganState {}

final class TunjanganInitial extends TunjanganState {}

class TunjanganLoading extends TunjanganState {}

class TunjanganLoaded extends TunjanganState {
  final List<DataTunjanganModel> data;

  TunjanganLoaded(this.data);
}

class TunjanganEmpty extends TunjanganState {}

class TunjanganError extends TunjanganState {
  final String message;

  TunjanganError(this.message);
}
