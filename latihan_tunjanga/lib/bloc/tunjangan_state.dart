part of 'tunjangan_bloc.dart';

@immutable
sealed class TunjanganState {}

final class TunjanganInitial extends TunjanganState {}
//tunjangan
class TunjanganLoading extends TunjanganState{}

class TunjanganLoaded extends TunjanganState {
  final List<Datum> data;

  TunjanganLoaded(this.data);
} 

class TunjanganError extends TunjanganState{
  final String errorMsg;

  TunjanganError(this.errorMsg);
}

//tunjangan detail
class TunjanganDetailLoading extends TunjanganState{}

class TunjanganDetailLoaded extends TunjanganState{
  final Data data;
  TunjanganDetailLoaded(this.data);

}

class TunjanganDetailError extends TunjanganState {
  final String errorMsg;

  TunjanganDetailError(this.errorMsg);
}

