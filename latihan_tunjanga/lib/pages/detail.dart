import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_tunjanga/bloc/tunjangan_bloc.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final detailBloc = TunjanganBloc()..add(GetDetailTunjanganEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<TunjanganBloc, TunjanganState>(
          bloc: detailBloc,
          builder: (context, state) {
          if(state is TunjanganDetailLoading){
            return const Center(
                child: Text("Sedang Memuat Data..."),
              );
          }else if(state is TunjanganDetailLoaded){
            return Center(
              child: Column(
                children: [
                  Text(state.data.berat),
                  Text(state.data.tglAmbil),
                  Text(state.data.lokasiAmbil),
                  Text(state.data.statusAmbil),
                  Text(state.data.qrcode)
                ],
              ),
            );
          }else if(state is TunjanganDetailError){
            return const Center(
                child: Text("Gagal Memuat Data..."),
              );
          }else{
            return const Center(
                child: Text("Gagal"),
              );
          }
        },),
      ),
    );
  }
}