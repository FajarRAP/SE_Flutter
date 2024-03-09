import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/detail_gaji_model.dart';
import '../widgets/button_detail_gaji.dart';
import '../widgets/item_detail_gaji.dart';

class DetailGaji extends StatefulWidget {
  const DetailGaji({super.key});

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
    ////nanti ini dipake di parameter endpoint buat APInya
    // print('Bulan ID : ${widget.bulanId}');
    // String infoGaji = widget.gaji;
    // String infoWaktu = widget.waktu;
    // GajiBloc detailGajiBloc = GajiBloc();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 4,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            arrowBackSvg,
            colorFilter: const ColorFilter.mode(
              kBlue,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
        shadowColor: const Color(0x25293241).withOpacity(.5),
        title: Text(
          'Detail Gaji',
          style: Styles.kPoppinsMedium.copyWith(
            fontSize: 18,
            color: kBlack,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 32,
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
                    'Rp. 750.000',
                    style: Styles.kPoppinsSemiBold.copyWith(
                      fontSize: 28,
                      color: kWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Februrari 2024',
                    style: Styles.kNunitoRegular.copyWith(
                      fontSize: 14,
                      color: kNeutral20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 8,
            color: const Color(0xFFEEF2F3),
          ),
          const SizedBox(
            height: 24,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ButtonDetailGaji(
                      kata: 'Pemasukan',
                      warnaBg: bgButton,
                      warnaFont: kWhite,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ButtonDetailGaji(
                      kata: 'Pengeluaran',
                      warnaBg: kLightGrey,
                      warnaFont: kNeutral60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                ItemDetailGaji(
                  gambar: pemasukanSvg,
                  nominal: 'Rp. 682.000',
                  keterangan: 'Pembayaran 1 Binco Ran Nusantara',
                ),
                SizedBox(
                  height: 12,
                ),
                ItemDetailGaji(
                  gambar: pengeluaranSvg,
                  nominal: 'Rp. 80.000',
                  keterangan: 'Noice Musuh Masyarakat',
                ),
              ],
            ),
          ),

          // BlocBuilder<GajiBloc, GajiState>(
          //   bloc: detailGajiBloc..add(GetDetailGajiEvent()),
          //   builder: (context, state) {
          //     if (state is DetailGajiLoading) {
          //       return Container(
          //         height: Screen.height,
          //         color: kWhite,
          //       );
          //     } else if (state is DetailGajiLoaded) {
          //       if (listPemasukan.isEmpty || listPotongan.isEmpty) {
          //         var data = state.data.data;
          //         listPemasukan.clear();
          //         listPotongan.clear();
          //         for (var item in data) {
          //           if (item.tipe == 'Pemasukan') {
          //             listPemasukan.add(item);
          //           } else if (item.tipe == 'Potongan') {
          //             listPotongan.add(item);
          //           }
          //         }
          //       }
          //       return Column(
          //         children: [
          //           if (currentGaji == 0)
          //             Column(
          //               children: [
          //                 Column(
          //                     children: listPemasukan.map(
          //                   (e) {
          //                     return
          //                   },
          //                 ).toList()),
          //                 SizedBox(
          //                   height: Screen.kSize8,
          //                 ),
          //               ],
          //             ),
          //           if (currentGaji == 1)
          //             Column(
          //               children: [
          //                 Column(
          //                     children: listPotongan.map(
          //                   (e) {
          //                     return Padding(
          //                       padding: EdgeInsets.symmetric(
          //                           horizontal: Screen.kSize20),
          //                       child: Column(
          //                         children: [
          //                           Container(
          //                             padding: EdgeInsets.symmetric(
          //                                 horizontal: Screen.kSize16,
          //                                 vertical: Screen.kSize16),
          //                             decoration: ShapeDecoration(
          //                               color: Colors.white,
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(12),
          //                               ),
          //                               shadows: const [
          //                                 BoxShadow(
          //                                   color: Color(0x087281DF),
          //                                   blurRadius: 4.11,
          //                                   offset: Offset(0, 0.52),
          //                                   spreadRadius: 0,
          //                                 ),
          //                                 BoxShadow(
          //                                   color: Color(0x0C7281DF),
          //                                   blurRadius: 6.99,
          //                                   offset: Offset(0, 1.78),
          //                                   spreadRadius: 0,
          //                                 ),
          //                                 BoxShadow(
          //                                   color: Color(0x0F7281DF),
          //                                   blurRadius: 10.20,
          //                                   offset: Offset(0, 4.11),
          //                                   spreadRadius: 0,
          //                                 )
          //                               ],
          //                             ),
          //                             child: Row(
          //                               children: [
          //                                 SvgPicture.asset(
          //                                   'assets/icons/potongan.svg',
          //                                   width: Screen.kSize40,
          //                                 ),
          //                                 SizedBox(width: Screen.kSize16),
          //                                 Column(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       e.nominal,
          //                                       style: Styles.kPoppinsMedium
          //                                           .copyWith(
          //                                               fontSize:
          //                                                   Screen.kSize18,
          //                                               color: kBlack),
          //                                     ),
          //                                     Text(
          //                                       e.keterangan,
          //                                       style: Styles.kNunitoRegular
          //                                           .copyWith(
          //                                               fontSize:
          //                                                   Screen.kSize14,
          //                                               color: kNeutral90),
          //                                     )
          //                                   ],
          //                                 )
          //                               ],
          //                             ),
          //                           ),
          //                           SizedBox(
          //                             height: Screen.kSize12,
          //                           )
          //                         ],
          //                       ),
          //                     );
          //                   },
          //                 ).toList()),
          //                 SizedBox(
          //                   height: Screen.kSize8,
          //                 ),
          //               ],
          //             ),
          //         ],
          //       );
          //     } else if (state is DetailGajiError) {
          //       return Container(
          //         height: Screen.height,
          //         color: const Color((0xFFF6F7F9)),
          //       );
          //     } else {
          //       return Container(
          //         height: Screen.height,
          //         color: const Color((0xFFF6F7F9)),
          //       );
          //     }
          //   },
          // ),
          // SizedBox(
          //   height: Screen.kSize40,
          // )
        ],
      ),
    );
  }
}
