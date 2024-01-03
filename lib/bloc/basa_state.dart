part of 'basa_bloc.dart';

@immutable
sealed class BasaState {}

final class BasaInitial extends BasaState {}

class BasaLoading extends BasaState {}

class BasaLoaded extends BasaState {
  final Basa data;
  BasaLoaded(this.data);
}

class BasaError extends BasaState {}
