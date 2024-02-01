import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../models/cuti-daftar_model.dart';
import '../bloc/other_cuti_bloc.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';

// Month

class SuntingCutiPage extends StatelessWidget {
  final DataCutiDaftar dataCutiDaftar;
  const SuntingCutiPage({
    super.key,
    required this.dataCutiDaftar,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final OtherCutiBloc otherCutiBloc = context.read<OtherCutiBloc>();
    String startDate = dataCutiDaftar.tanggalMulai;
    String endDate = dataCutiDaftar.tanggalSelesai;

    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: bgColor,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  otherCutiBloc.add(InitialEvent());
                },
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kSize20),
              child: Row(
                children: [
                  Container(
                    width: kSize18,
                    height: kSize18,
                    decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadiusDirectional.circular(kSize4)),
                  ),
                  SizedBox(width: kSize16),
                  Text(
                    'Edit Cuti',
                    style: kPoppinsMedium.copyWith(
                        fontSize: kSize24, color: kBlack),
                  ),
                ],
              ),
            ),
            SizedBox(height: kSize24),
            Container(
              height: kSize8,
              color: const Color(0xFFF0F1F3),
            ),
            SizedBox(height: kSize32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kSize20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai Cuti',
                    style: kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: kSize14,
                    ),
                  ),
                  SizedBox(height: kSize8),
                  BlocBuilder<OtherCutiBloc, OtherCutiState>(
                    bloc: otherCutiBloc,
                    builder: (context, state) {
                      if (state is StartDatePicked) {
                        startDate = state.date;
                      } else if (state is OtherCutiInitial) {
                        startDate = dataCutiDaftar.tanggalMulai;
                      }
                      return ContainerDesigned(
                        widget: Tanggal(pesan: startDate),
                      );
                    },
                  ),
                  SizedBox(height: kSize24),
                  Text(
                    'Selesai Cuti',
                    style: kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: kSize14,
                    ),
                  ),
                  SizedBox(height: kSize8),
                  BlocBuilder<OtherCutiBloc, OtherCutiState>(
                    bloc: otherCutiBloc,
                    builder: (context, state) {
                      if (state is EndDatePicked) {
                        endDate = state.date;
                      } else if (state is OtherCutiInitial) {
                        endDate = dataCutiDaftar.tanggalSelesai;
                      }
                      return ContainerDesigned(
                        widget: Tanggal(
                          pesan: endDate,
                          isMulai: false,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: kSize24),
                  Text(
                    'Keterangan Cuti',
                    style: kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: kSize14,
                    ),
                  ),
                  SizedBox(height: kSize8),
                  ContainerDesigned(
                    widget: Keterangan(keterangan: dataCutiDaftar.keterangan),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
              // Jarak penyebaran shadow
              blurRadius: 4, // Radius blur shadow
              offset: const Offset(0, -1),
            ) // Posisi shadow (x, y)
          ],
        ),
        padding: EdgeInsets.all(kSize16),
        child: ElevatedButton(
          onPressed: () => successDialog(
            context,
            'Berhasil Sunting',
            'Cuti Berhasil Disunting',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            fixedSize: Size(SizeConfig.screenWidth!, kSize40 + kSize10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSize10)),
          ),
          child: Text(
            'Sunting Cuti',
            style: kPoppinsMedium.copyWith(
              fontSize: kSize16,
              color: kWhite,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ContainerDesigned extends StatelessWidget {
  final Widget widget;
  const ContainerDesigned({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSize12),
          ),
          shadows: boxShadow,
        ),
        padding: EdgeInsets.all(kSize16),
        child: widget);
  }
}

class Keterangan extends StatelessWidget {
  final String keterangan;
  const Keterangan({
    super.key,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: keterangan);
    return TextField(
      controller: controller,
      maxLines: 5,
      style: kNunitoRegular.copyWith(
        fontSize: kSize16,
        color: kNeutral90,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintStyle: kNunitoRegular.copyWith(
          fontSize: kSize16,
          color: kNeutral70,
        ),
        contentPadding: const EdgeInsets.all(0), // Menghilangkan padding
        border: InputBorder.none, // Menghilangkan border
        hintText: 'Masukan alasan cuti',
      ),
    );
  }
}

class Tanggal extends StatelessWidget {
  final String pesan;
  final bool isMulai;
  const Tanggal({super.key, required this.pesan, this.isMulai = true});

  @override
  Widget build(BuildContext context) {
    final OtherCutiBloc otherCutiBloc = context.read<OtherCutiBloc>();
    return InkWell(
      onTap: () async {
        final DateTime? date = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (date != null) {
          if (isMulai) {
            otherCutiBloc.add(PickStartDateEvent(
              date: DateFormat('d MMMM y').format(date),
            ));
          } else {
            otherCutiBloc.add(PickEndDateEvent(
              date: DateFormat('d MMMM y').format(date),
            ));
          }
        }
      },
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/pilih-tanggal.svg'),
          SizedBox(width: kSize12),
          Expanded(
            child: Text(
              pesan,
              style: kNunitoRegular.copyWith(
                color: kNeutral90,
                fontSize: kSize16,
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/arrow-right.svg'),
        ],
      ),
    );
  }
}
