part of 'rekap_bulanan_cubit.dart';

@immutable
sealed class RekapBulananState {}

final class RekapBulananInitial extends RekapBulananState {}

class RekapBulananLoading extends RekapBulananState {}

class RekapBulananLoaded extends RekapBulananState {
  final DataRekap data;

  RekapBulananLoaded(this.data);
}

class RekapBulananEmpty extends RekapBulananState {}

class RekapBulananError extends RekapBulananState {
  final String message;
  
  RekapBulananError(this.message);
}