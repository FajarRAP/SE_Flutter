import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'other_cuti_event.dart';
part 'other_cuti_state.dart';

class OtherCutiBloc extends Bloc<OtherCutiEvent, OtherCutiState> {
  OtherCutiBloc() : super(OtherCutiInitial()) {
    on<InitialEvent>(initialEvent);
    on<PickStartDateEvent>(pickStartDateEvent);
    on<PickEndDateEvent>(pickEndDateEvent);
  }

  FutureOr<void> initialEvent(
    InitialEvent event,
    Emitter<OtherCutiState> emit,
  ) {
    emit(OtherCutiInitial());
  }

  FutureOr<void> pickStartDateEvent(
    PickStartDateEvent event,
    Emitter<OtherCutiState> emit,
  ) {
    emit(StartDatePicked(date: event.date));
  }

  FutureOr<void> pickEndDateEvent(
    PickEndDateEvent event,
    Emitter<OtherCutiState> emit,
  ) {
    emit(EndDatePicked(date: event.date));
  }
}
