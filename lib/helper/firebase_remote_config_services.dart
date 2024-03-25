
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'firebase_remote_config_keys.dart';
import '../core/constants_finals.dart';

class FirebaseRemoteConfigServices {
  final FirebaseRemoteConfig remoteConfig;
  FirebaseRemoteConfigServices._()
      : remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigServices? instance;

  factory FirebaseRemoteConfigServices() =>
      instance ??= FirebaseRemoteConfigServices._();

  String getString(String key) => remoteConfig.getString(key);
  bool getBool(String key) => remoteConfig.getBool(key);
  int getInt(String key) => remoteConfig.getInt(key);
  double getDouble(String key) => remoteConfig.getDouble(key);

  Future<void> setConfigIntervalSettings() async =>
      remoteConfig.setConfigSettings(
        RemoteConfigSettings(
            fetchTimeout: const Duration(minutes: 1),
            minimumFetchInterval: Duration.zero),
      );

  Future<void> setDefaults() async => remoteConfig.setDefaults(
        const {
          FirebaseRemoteConfigKeys.url: url,
          FirebaseRemoteConfigKeys.route: route,
        },
      );

  Future<void> fetchAndActivate() async {
    await remoteConfig.fetchAndActivate();
  }

  Future<void> initialize() async {
    await setConfigIntervalSettings();
    await setDefaults();
    await fetchAndActivate();
  }

  String getAPIUrl() {
    return remoteConfig.getString(FirebaseRemoteConfigKeys.url);
  }

  String getAPIRoute() {
    return remoteConfig.getString(FirebaseRemoteConfigKeys.route);
  }
}
