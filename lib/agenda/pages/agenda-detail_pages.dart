import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_agenda/agenda/bloc/agenda_bloc.dart';

class AgendaDetailPage extends StatelessWidget {
  final String id;
  const AgendaDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final dataBloc = AgendaBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda Detail"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: BlocBuilder<AgendaBloc, AgendaState>(
          bloc: dataBloc..add(GetAgendaDetailEvent(id)),
          builder: (context, state) {
            if (state is AgendaDetailLoading) {
              return const CircularProgressIndicator();
            } else if (state is AgendaDetailLoaded) {
              final detailAgenda = state.data.data;
              return Column(
                children: [
                  Text(detailAgenda.jam),
                  Text(detailAgenda.keterangan),
                  Text(detailAgenda.lokasi),
                  Text(detailAgenda.namaEvent),
                  Text(detailAgenda.peserta),
                  Text(detailAgenda.tanggal),
                  Text(detailAgenda.unitPengundang),
                ],
              );
            }
            return const Text("Gagal");
          },
        ),
      ),
    );
  }
}
