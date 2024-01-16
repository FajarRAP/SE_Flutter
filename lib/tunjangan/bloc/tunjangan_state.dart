part of 'tunjangan_bloc.dart';

@immutable
sealed class TunjanganState {}

final class TunjanganInitial extends TunjanganState {}
//tunjangan
class TunjanganLoading extends TunjanganState{}

class TunjanganLoaded extends TunjanganState {
  final List<DataTunjangan> data;

  TunjanganLoaded(this.data);
} 

class TunjanganError extends TunjanganState{
  final String errorMsg;

  TunjanganError(this.errorMsg);
}

//tunjangan detail
class TunjanganDetailLoading extends TunjanganState{}

class TunjanganDetailLoaded extends TunjanganState{
  final DetailTunjangan data;
  TunjanganDetailLoaded(this.data);

}

class TunjanganDetailError extends TunjanganState {
  final String errorMsg;

  TunjanganDetailError(this.errorMsg);
}

//tunjangan berdasarkan tahun

class TunjanganTahunLoading extends TunjanganState{}

class TunjanganTahunLoaded extends TunjanganState{
  final TunjanganTahun data;
  TunjanganTahunLoaded(this.data);
}

class TunjanganTahunError extends TunjanganState {
  final String errorMsg;
  TunjanganTahunError(this.errorMsg);
}
