part of 'other_cuti_bloc.dart';

@immutable
sealed class OtherCutiEvent {}

class InitialEvent extends OtherCutiEvent {}

class PickStartDateEvent extends OtherCutiEvent {
  final String date;

  PickStartDateEvent({required this.date});
}

class PickEndDateEvent extends OtherCutiEvent {
  final String date;

  PickEndDateEvent({required this.date});
}
