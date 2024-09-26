import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 4,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(
              kBlue,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        shadowColor: const Color(0x25293241),
        title: SizedBox(
          child: Text(
            'Pengaturan Notifkasi',
            style: Styles.kPoppinsMedium.copyWith(
              color: kBlack,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 32,
        ),
        child: Column(
          children: [
            // Agenda
            ItemNotification(
              title: 'Notifikasi Agenda',
              subtitle: 'Semua nofitikasi tentang agenda rapat terdekat.',
              isSwitched: isSwitched,
              onChanged: (value) => setState(() => isSwitched = value),
            ),
            const SizedBox(height: 16),
             Divider(
              color: kGrey.withOpacity(20/100),
             ),
            // Umum
            ItemNotification(
              title: 'Notifikasi Umum',
              subtitle:
                  'Semua notifikasi tentang hal Universitas Ahmad Dahlan.',
              isSwitched: isSwitched,
              onChanged: (value) => setState(() => isSwitched = value),
            ),
            const SizedBox(height: 16),
             Divider(
              color: kGrey.withOpacity(20/100),
             ),
          ],
        ),
      ),
    );
  }
}

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSwitched,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool isSwitched;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 16,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral80,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 40),
        Switch(
          value: isSwitched,
          onChanged: onChanged,
          activeTrackColor: const Color(0xFFAACFE7),
          activeColor: kBlue,
        ),
      ],
    );
  }
}
