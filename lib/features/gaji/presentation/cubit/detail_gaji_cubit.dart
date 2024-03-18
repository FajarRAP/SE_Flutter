
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/detail_gaji_model.dart';
import '../../data/repositories/gaji_repositories_impl.dart';

part 'detail_gaji_state.dart';

class DetailGajiCubit extends Cubit<DetailGajiState> {
  DetailGajiCubit() : super(DetailGajiInitial());

  DetailGajiModel? detailGaji;
  DataDetailGaji? dataDetailGaji;

  Future<void> getDetailGaji(int current) async {
    emit(DetailGajiLoading());
    final result = await locator<GajiRepositoriesImpl>().getDetailGaji();
    result.fold(
      (failure) => emit(DetailGajiError(failure.message)),
      (data) {
        detailGaji = data;
        if (detailGaji!.data.isNotEmpty) {
          if (current == 0) {
            var data = detailGaji!.data
                .where((i) => i.tipe == 'Pemasukan').toList();
            emit(DetailGajiLoaded(data));
          } else if(current == 1){
            var data = detailGaji!.data
                .where((i) => i.tipe == 'Potongan')
                .toList();       
                 emit(DetailGajiLoaded(data));    
          }
        } else {
          emit(DetailGajiEmpty());
        }
      },
    );
  }
}
