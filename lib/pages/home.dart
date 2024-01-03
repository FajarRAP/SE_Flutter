import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_bloc/bloc/basa_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<BasaBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsumsi SUNTOL"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<BasaBloc, BasaState>(
          bloc: dataBloc,
          builder: (context, state) {
            if (state is BasaLoading) {
              return const CircularProgressIndicator();
            } else if (state is BasaLoaded) {
              return ListView.builder(
                itemCount: state.data.words.length,
                itemBuilder: (context, index) {
                  final sorangan = state.data.words[index].sorangan;
                  return Text(sorangan);
                },
              );
            }
            return const Text("Gagal Ambil data");
          },
        ),
      ),
    );
  }
}
