  import 'package:get_it/get_it.dart';

import '../dashboard/data/data_sources/remote.dart';
import '../dashboard/data/repositories/detail_presensi_hari_ini_impl.dart';
import 'data/data_sources/remote.dart';
import 'data/repositories/presensi_repositories_impl.dart';
import 'data/repositories/shift_berikutnya_repositories_impl.dart';

final GetIt locator = GetIt.instance;
  void dependencyInjection() {
    locator.registerLazySingleton<PresensiRepositoriesImpl>(
      () =>
          PresensiRepositoriesImpl(presensiService: locator<PresensiService>()),
    );

    locator.registerLazySingleton<DetailPresensiHariIniImpl>(
      () => DetailPresensiHariIniImpl(
        detailPresensiService: locator<DetailPresensiHariIniService>(),
      ),
    );

    locator.registerLazySingleton<PresensiService>(() => PresensiService());

    locator.registerLazySingleton<ShiftBerikutnyaRepositoriesImpl>(
      () => ShiftBerikutnyaRepositoriesImpl(
        presensiService: locator<PresensiService>(),
      ),
    );
  }