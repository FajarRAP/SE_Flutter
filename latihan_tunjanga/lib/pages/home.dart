import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_tunjanga/bloc/tunjangan_bloc.dart';
import 'package:latihan_tunjanga/models/tunjangan_model.dart';
import 'package:latihan_tunjanga/pages/detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final databloc = TunjanganBloc()..add(GetTunjanganEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("COK"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<TunjanganBloc, TunjanganState>(
          bloc: databloc,
          builder: (context, state) {
            if (state is TunjanganLoading) {
              return const Center(
                child: Text("Sedang Memuat Data..."),
              );
            } else if (state is TunjanganLoaded) {
              return TunjanganListItem(data: state.data);
            } else if (state is TunjanganError) {
              return const Center(
                child: Text("Gagal Memuat Data..."),
              );
            } else {
              return const Center(
                child: Text("Gagal"),
              );
            }
          },
        ),
      ),
    );
  }
}

class TunjanganListItem extends StatelessWidget {
  final List<Datum> data;
  const TunjanganListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
              child: Column(
                children: [
                  Text(data[index].periode),
                  Text(data[index].berat),
                  Text(data[index].lokasiAmbil),
                  Text(data[index].statusAmbil),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(),
                  ),
                );
              }),
        );
      },
    );
  }
}
