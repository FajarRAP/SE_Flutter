import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";
import "package:konsumsi_api_agenda/gaji/models/gaji_model.dart";
import "package:konsumsi_api_agenda/gaji/pages/detail_gaji.dart";
import "package:konsumsi_api_agenda/helper/size_config.dart";
import "../../helper/app_styles.dart";
import "../bloc/gaji_bloc.dart";

class InformasiGaji extends StatefulWidget {
  const InformasiGaji({super.key});

  @override
  State<InformasiGaji> createState() => _InformasiGajiState();
}

class _InformasiGajiState extends State<InformasiGaji> {
  
  @override
  Widget build(BuildContext context) {
    final gajibloc = GajiBloc();
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kNeutral20,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlue,
          ),
          ),
          
          backgroundColor: kWhite,
          title: Text(
            'Informasi Gaji',
            style: kPoppinsSemiBold.copyWith(fontSize: 18, color: kBlack),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          backgroundColor: kWhite,
          color: kBlue,
          onRefresh: () async {
            gajibloc.add(GetGajiEvent());
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 2.85,
                  vertical: SizeConfig.blockSizeVertical! * 2.85,
                ),
                child: BlocBuilder<GajiBloc, GajiState>(
                  bloc: gajibloc..add(GetGajiEvent()),
                  builder: (context, state) {
                    print(state);
                    if (state is GajiLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kBlue,
                        ),
                      );
                    } else if (state is GajiLoaded) {
                      // final List<Gaji> data = state.data;
                      var data = state.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: data.map(
                          (item) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailInformasiGaji(gaji: item.gaji, waktu: item.waktu,),
                                            ),
                                          );
                                  },
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: kWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.85,
                                        vertical:
                                            SizeConfig.blockSizeVertical! * 2.85,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/gaji.svg',
                                              ),
                                          SizedBox(
                                            width:
                                                SizeConfig.blockSizeHorizontal! *
                                                    3.00,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Rp. ${item.gaji}',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.85,
                                                  color: kBlack,
                                                ),
                                              ),
                                              Text(
                                                item.waktu,
                                                style: kPoppinsRegular.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.35,
                                                  color: kNeutral70,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1.85,
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      );
                    } else if (state is GajiError) {
                      return Center(child: Text(state.errorMsg));
                    } else {
                      return const Center(
                        child: Text('Gagal'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

