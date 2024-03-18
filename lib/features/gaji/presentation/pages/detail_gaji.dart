
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/detail_gaji_model.dart';
import '../cubit/detail_gaji_cubit.dart';
import '../widgets/detail_gaji_kosong.dart';
import '../widgets/item_detail_gaji.dart';

class DetailGaji extends StatefulWidget {
  final String gaji;
  final String waktu;
  final String bulanId;
  const DetailGaji(
      {Key? key,
      required this.gaji,
      required this.waktu,
      required this.bulanId})
      : super(key: key);

  @override
  State<DetailGaji> createState() => _DetailGajiState();
}

class _DetailGajiState extends State<DetailGaji> {
  bool showAll = false;

  List gaji = ['Pemasukan', 'Potongan'];
  int currentGaji = 0;
  List<DataDetailGaji> listPemasukan = [];
  List<DataDetailGaji> listPotongan = [];

  @override
  Widget build(BuildContext context) {
    final DetailGajiCubit detailGajiCubit = context.read<DetailGajiCubit>();
    ////nanti ini dipake di parameter endpoint buat APInya
    // print('Bulan ID : ${widget.bulanId}');
    String infoGaji = widget.gaji;
    String infoWaktu = widget.waktu;

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Detail Gaji',
            style: Styles.kPoppinsMedium.copyWith(
              fontSize: Screen.kSize16,
              color: kBlack,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: Screen.kSize32),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Screen.kSize20,
            ),
            child: Container(
              width: Screen.width,
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
                vertical: Screen.kSize16,
              ),
              decoration: ShapeDecoration(
                color: kBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoGaji,
                    style: Styles.kPoppinsSemiBold.copyWith(
                      fontSize: Screen.kSize28,
                      color: kWhite,
                    ),
                  ),
                  SizedBox(height: Screen.kSize4),
                  Text(
                    infoWaktu,
                    style: Styles.kNunitoRegular.copyWith(
                      fontSize: Screen.kSize14,
                      color: kNeutral20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Screen.kSize40),
          Container(
            height: Screen.kSize8,
            color: const Color(0xFFEEF2F3),
          ),
          SizedBox(height: Screen.kSize24),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Screen.kSize20,
            ),
            child: SizedBox(
              height: 32,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 12,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: gaji.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          currentGaji = index;
                        },
                      );
                    },
                    child: Container(
                      height: Screen.kSize32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentGaji == index ? kOrange : kLightGrey),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Center(
                        child: Text(
                          gaji[index],
                          style: Styles.kPoppinsRegular.copyWith(
                              color: currentGaji == index ? kWhite : kNeutral60,
                              fontSize: Screen.kSize12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: Screen.kSize24,
          ),
          Expanded(
            child: BlocBuilder<DetailGajiCubit, DetailGajiState>(
              bloc: detailGajiCubit..getDetailGaji(currentGaji),
              builder: (context, state) {
                if (state is DetailGajiLoading) {
                  return Container(
                    height: Screen.height,
                    color: kWhite,
                  );
                } else if (state is DetailGajiLoaded) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Screen.kSize20,
                    ),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: Screen.kSize16,
                        );
                      },
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return ItemDetailGaji(
                          dataDetailGaji:
                             state.data[index],
                          current: currentGaji,
                        );
                      },
                    ),
                  );
                } else if (state is DetailGajiEmpty) {
                  return const DetailGajiKosong();
                } else if (state is DetailGajiError) {
                  return Container(
                    height: Screen.height,
                    color: const Color((0xFFF6F7F9)),
                  );
                } else {
                  return Container(
                    height: Screen.height,
                    color: const Color((0xFFF6F7F9)),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: Screen.kSize40,
          )
        ],
      ),
    );
  }
}
