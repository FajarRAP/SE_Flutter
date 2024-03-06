part of 'tunjangan_bloc.dart';

@immutable
sealed class TunjanganEvent {}

class GetTunjanganEvent extends TunjanganEvent {
  final String selectedDate;

  GetTunjanganEvent(this.selectedDate);
} // event untuk mendapatkan seluruh tunjangan

class GetDetailTunjanganEvent
    extends TunjanganEvent {}  //event untuk mendapatkan detail dari tunjangan yang di klik

// class GetDetailTunjanganBerdasarkanTahunEvent extends TunjanganEvent{ //event ketika pengguna mencari tunjangan berdasarkan tahun
//   final String selectedDate;

//   GetDetailTunjanganBerdasarkanTahunEvent(this.selectedDate);
// } 
