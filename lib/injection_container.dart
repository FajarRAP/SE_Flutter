import 'package:get_it/get_it.dart';
import 'package:konsumsi_api_agenda/features/presensi/data/data_sources/remote.dart';

import 'features/agenda/data/data_sources/remote.dart';
import 'features/agenda/data/repositories/agenda_repositories_impl.dart';
import 'features/dashboard/data/data_sources/remote.dart';
import 'features/dashboard/data/repositories/detail_presensi_hari_ini_impl.dart';
import 'features/gaji/data/data_sources/remote.dart';
import 'features/gaji/data/repositores/gaji_repositories_impl.dart';
import 'features/layanan_cuti/data/data_sources/remote.dart';
import 'features/layanan_cuti/data/repositories/cuti_repositories_impl.dart';
import 'features/monitoring/data/data_sources/remote.dart';
import 'features/monitoring/data/repositories/monitoring_repositories_impl.dart';
import 'features/presensi/data/repositories/presensi_repositories_impl.dart';
import 'features/presensi/data/repositories/shift_berikutnya_repositories_impl.dart';
import 'features/shift/data/data_sources/remote.dart';
import 'features/shift/data/repositories/shift_repositories_impl.dart';
import 'features/tunjangan/data/data_sources/remote.dart';
import 'features/tunjangan/data/repositories/tunjangan_repositories_impl.dart';

final GetIt locator = GetIt.instance;

void dependencyInjection() {
  locator.registerLazySingleton<AgendaService>(
    () => AgendaService(),
  );

  locator.registerLazySingleton<AgendaRepositoriesImpl>(
    () => AgendaRepositoriesImpl(
      agendaService: locator<AgendaService>(),
    ),
  );

  locator.registerLazySingleton<CutiService>(
    () => CutiService(),
  );

  locator.registerLazySingleton<CutiRepositoriesImpl>(
    () => CutiRepositoriesImpl(
      cutiService: locator<CutiService>(),
    ),
  );

  locator.registerLazySingleton<MonitoringService>(
    () => MonitoringService(),
  );

  locator.registerLazySingleton<MonitoringRepositoriesImpl>(
    () => MonitoringRepositoriesImpl(
      monitoringService: locator<MonitoringService>(),
    ),
  );

  locator.registerLazySingleton<GajiService>(
    () => GajiService(),
  );

  locator.registerLazySingleton<GajiRepositoriesImpl>(
    () => GajiRepositoriesImpl(
      gajiService: locator<GajiService>(),
    ),
  );

  locator.registerLazySingleton<ShiftService>(
    () => ShiftService(),
  );

  locator.registerLazySingleton<ShiftRepositoriesImpl>(
    () => ShiftRepositoriesImpl(
      shiftService: locator<ShiftService>(),
    ),
  );

  locator.registerLazySingleton<TunjanganService>(
    () => TunjanganService(),
  );

  locator.registerLazySingleton<TunjanganRepositoriesImpl>(
    () => TunjanganRepositoriesImpl(
      tunjanganService: locator<TunjanganService>(),
    ),
  );

  locator.registerLazySingleton<PresensiRepositoriesImpl>(
    () => PresensiRepositoriesImpl(presensiService: locator<PresensiService>()),
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
