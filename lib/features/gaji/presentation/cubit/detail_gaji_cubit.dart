import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../injection_container.dart';
import '../../data/models/detail_gaji_model.dart';
import '../../data/models/gaji.dart';
import '../../data/repositores/gaji_repositories_impl.dart';

part 'detail_gaji_state.dart';

class DetailGajiCubit extends Cubit<DetailGajiState> {
  DetailGajiCubit() : super(DetailGajiInitial());

  DetailGajiModel? detailGaji;
  DataGajiModel? dataGaji;
  bool isPemasukan = true;

  // Setter
  set setDataGaji(final DataGajiModel data) => dataGaji = data;

  // Getter
  String get getNominalGaji => dataGaji!.bulan;
  String get getBulanGaji => dataGaji!.nominal;
  String get getBulanId => dataGaji!.bulanId;
  bool get getIsPemasukan => isPemasukan;

  Future<void> getDetailGaji() async {
    isPemasukan = true;
    emit(DetailGajiLoading());

    final result = await locator<GajiRepositoriesImpl>().getDetailGaji();

    result.fold(
      (failure) {
        emit(DetailGajiError(failure.message));
      },
      (success) {
        detailGaji = success;
        final List<DataDetailGajiModel> pemasukan = detailGaji!.data
            .where((element) => element.tipe != 'Potongan')
            .toList();
        emit(DetailGajiLoaded(pemasukan));
      },
    );
  }

  void clickPemasukan() {
    final List<DataDetailGajiModel> pemasukan = detailGaji!.data
        .where((element) => element.tipe != 'Potongan')
        .toList();
    isPemasukan = true;
    emit(DetailGajiLoaded(pemasukan));
  }

  void clickPotongan() {
    final List<DataDetailGajiModel> potongan = detailGaji!.data
        .where((element) => element.tipe == 'Potongan')
        .toList();
    isPemasukan = false;
    emit(DetailGajiLoaded(potongan));
  }
}
