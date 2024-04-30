import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/detail_presensi.dart';
import '../../data/repositories/detail_presensi_hari_ini_impl.dart';
part 'detail_presensi_today_state.dart';

class DetailPresensiTodayCubit extends Cubit<DetailPresensiTodayState> {
  DetailPresensiTodayCubit() : super(DetailPresensiTodayInitial());

  Data? dataPresensiToday; 

  Future<void> getDetailPresensiToday() async {
    final result = await locator<DetailPresensiHariIniImpl>().getDetailPresensiHariIni();
    
    result.fold(
      (failure) {
        emit(DetailPresensiTodayError(failure.message));
      },
      (success) {
        emit(DetailPresensiTodayLoaded(success.data));
        print(success.data);
      },
    );
  }
}
