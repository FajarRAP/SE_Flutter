import 'package:get_it/get_it.dart';

import 'features/agenda/data/data_sources/remote.dart';
import 'features/agenda/data/repositories/agenda_repositories_impl.dart';
import 'features/layanan_cuti/data/data_sources/remote.dart';
import 'features/layanan_cuti/data/repositories/cuti_repositories_impl.dart';

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
}
