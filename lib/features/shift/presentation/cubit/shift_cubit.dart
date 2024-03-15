import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/shift_model.dart';
import '../../data/repositories/shift_repositories_impl.dart';

part 'shift_state.dart';

class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit() : super(ShiftInitial());

  ShiftModel? shift;

  int currentDay = DateTime.now().weekday - 1;

  // Getter
  int get getCurrentDay => currentDay;

  Future<void> getShifts() async {
    emit(ShiftLoading());

    final result = await locator<ShiftRepositoriesImpl>().getShifts();

    result.fold(
      (failure) {
        emit(ShiftError(failure.message));
      },
      (success) {
        shift = success;
        if (success.data.isNotEmpty) {
          emit(ShiftLoaded(success.data));
        } else {
          emit(ShiftEmpty());
        }
      },
    );
  }

  void clickDay(final int current) {
    currentDay = current;
  }
}
