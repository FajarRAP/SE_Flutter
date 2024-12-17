import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../../../gaji/presentation/pages/gaji.dart';
import '../ganti_password/ganti_password.dart';
import '../widgets/detail_profile.dart';
import '../widgets/extra_profile.dart';
import '../widgets/item_akun_saya.dart';
import 'akun_wifi.dart';
import 'informasi_pribadi.dart';
import 'notification_settings.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kWhite,
              centerTitle: true,
              elevation: 4,
              forceElevated: true,
              leading: const SizedBox(),
              title: Text(
                'Profil',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 20,
                ),
              ),
              shadowColor: const Color(0x25293241),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Detail Profile
                const DetailProfile(),

                const SizedBox(height: 32),

                // NIPM
                const ExtraProfile(
                  path: 'assets/icons/profil-NIPM.svg',
                  title: 'NIPM',
                  subtitle: '19730710 200409 111 0951298',
                ),

                const SizedBox(height: 16),

                // Unit Kerja
                const ExtraProfile(
                  path: 'assets/icons/profil-NIDN.svg',
                  title: 'Unit kerja',
                  subtitle:
                      'FTI - laboran riset sistem cerdas dan rekayasa perangkat lunak dan data.',
                ),

                const SizedBox(height: 32),
                Container(
                  height: 8,
                  color: const Color(0xFFF6F7F9),
                ),
                const SizedBox(height: 32),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akun saya',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Informasi Pribadi
                    const ItemAkunSaya(
                      path: 'assets/icons/informasi-pribadi.svg',
                      title: 'Informasi Pribadi',
                      page: InformasiPribadiPage(),
                    ),
                    const SizedBox(height: 24),

                    // Ganti Password
                    const ItemAkunSaya(
                      path: 'assets/icons/ganti-password.svg',
                      title: 'Ganti Password',
                      page: GantiPassword(),
                    ),
                    const SizedBox(height: 24),

                    // Akun Wifi
                    const ItemAkunSaya(
                      path: 'assets/icons/akun-wifi.svg',
                      title: 'Akun Wi-Fi',
                      page: AkunWiFiPage(),
                    ),
                    const SizedBox(height: 24),

                    // Gaji
                    Text(
                      'Gaji saya',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ItemAkunSaya(
                      path: 'assets/icons/informasi-gaji.svg',
                      title: 'Informasi Gaji',
                      page: GajiPage(),
                    ),
                    const SizedBox(height: 24),

                    // Notifikasi
                    Text(
                      'Notifikasi',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ItemAkunSaya(
                      path: 'assets/icons/pengaturan-notifikasi.svg',
                      title: 'Pengaturan Notifikasi',
                      page: NotificationSettingsPage(),
                    ),
                    const SizedBox(height: 24),

                    // Keluar
                    Text(
                      'Keluar',
                      style: Styles.kPoppinsSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const ItemAkunSaya(
                      path: 'assets/icons/keluar.svg',
                      title: 'Keluar Sekarang',
                      page: SizedBox(),
                      isLogout: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
