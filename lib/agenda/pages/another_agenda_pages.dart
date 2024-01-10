import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/agenda_bloc.dart';
import '../models/agenda_model.dart';
// import '../helper/size_config.dart';
import '../helper/app_styles.dart';
import 'agenda_pages_origin.dart';

class AgendaTes extends StatelessWidget {
  const AgendaTes({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILDED");
    // SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            onChanged: (value) {},
          ),
          BlocBuilder<AgendaBloc, AgendaState>(
            bloc: AgendaBloc()..add(GetAgendaEvent()),
            builder: (context, state) {
              print(state);
              if (state is AgendaLoading) {
                return const CircularProgressIndicator();
              } else if (state is AgendaLoaded) {
                final List<Datum> data = state.data.data;
                return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 14,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x087281DF),
                            blurRadius: 4.11,
                            offset: Offset(0, 0.52),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x0C7281DF),
                            blurRadius: 6.99,
                            offset: Offset(0, 1.78),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x0F7281DF),
                            blurRadius: 10.20,
                            offset: Offset(0, 4.11),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].namaEvent,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kPoppinsMedium.copyWith(
                              fontSize: 14,
                              color: kBlack,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Dari: ',
                                  style: kNunitoRegular.copyWith(
                                    fontSize: 14,
                                    color: kNeutral80,
                                  ),
                                ),
                                TextSpan(
                                  text: data[index].unitPengundang,
                                  style: kNunitoRegular.copyWith(
                                    fontSize: 14,
                                    color: kBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              data[index].tanggal,
                              style: kNunitoRegular.copyWith(
                                fontSize: 14,
                                color: kNeutral70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                // return Column(
                //   children: data
                //       .map((e) => ItemAgenda(
                //           namaEvent: e.namaEvent,
                //           unitPengundang: e.unitPengundang,
                //           tanggal: e.tanggal))
                //       .toList(),
                // );
              }
              return Text("HALO DUNIA");
            },
          ),
        ],
      ),
    );
  }
}
