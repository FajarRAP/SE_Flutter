part of 'tunjangan_cubit.dart';

@immutable
sealed class TunjanganState {}

final class TunjanganInitial extends TunjanganState {}

final class TunjanganLoading extends TunjanganState{}

final class TunjanganLoaded extends TunjanganState {}

final class TunjanganEmpty extends TunjanganState {}

final class TunjanganError extends TunjanganState{
  final String message;

  TunjanganError(this.message);
}
