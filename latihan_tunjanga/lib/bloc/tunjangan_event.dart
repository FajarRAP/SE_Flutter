part of 'tunjangan_bloc.dart';

@immutable
sealed class TunjanganEvent {}

class GetTunjanganEvent extends TunjanganEvent{}

class GetDetailTunjanganEvent extends TunjanganEvent{}
