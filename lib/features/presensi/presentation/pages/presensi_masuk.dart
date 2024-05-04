import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/card_location.dart';
import '../widgets/card_masuk.dart';
import '../widgets/card_pulang.dart';
import '../widgets/item_next_shift.dart';
import '../widgets/success_dialog.dart';

class PresensiMasukPage extends StatelessWidget {
  const PresensiMasukPage({super.key});

  @override
  Widget build(BuildContext context) {
    // bool showAll = false;
    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              title: Text(
                'Presensi Hari Ini',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
              leading: const SizedBox(),
            ),
          ];
        },
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
            color: Color(0xFFF6F7F9),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lokasi
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: CardLocation(),
              ),

              const SizedBox(height: 16),

              // Masuk and Pulang
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    // Masuk
                    Expanded(
                      child: CardMasuk(),
                    ),
                    SizedBox(width: 16),
                    // Pulang
                    Expanded(
                      child: CardPulang(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Container(
                height: 8,
                color: const Color(0xFFEEF2F3),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Shift berikutnya',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kNeutral70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  // List Next Shift
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => const ItemNextShift(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, -1),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => presensiMasuk(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            fixedSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Presensi Masuk',
            style: Styles.kPoppinsMedium.copyWith(
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
