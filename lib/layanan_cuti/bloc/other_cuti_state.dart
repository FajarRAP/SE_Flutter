part of 'other_cuti_bloc.dart';

@immutable
sealed class OtherCutiState {}

final class OtherCutiInitial extends OtherCutiState {}

class StartDatePicked extends OtherCutiState {
  final String date;

  StartDatePicked({required this.date});
}

class EndDatePicked extends OtherCutiState {
  final String date;

  EndDatePicked({required this.date});
}
