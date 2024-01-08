import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/agenda_bloc.dart';
import 'agenda-detail_pages.dart';


class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<AgendaBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsumsi Agenda"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            dataBloc.add(GetAgendaEvent());
          },
          child: BlocBuilder<AgendaBloc, AgendaState>(
            bloc: dataBloc..add(GetAgendaEvent()),
            builder: (context, state) {
              if (state is AgendaLoading) {
                return const CircularProgressIndicator();
              } else if (state is AgendaLoaded) {
                return ListView.builder(
                  itemCount: state.data.data.length,
                  itemBuilder: (context, index) {
                    final agenda = state.data.data[index];
                    return InkWell(
                      child: Column(
                        children: [
                          Text(agenda.idEvent),
                          Text(agenda.namaEvent),
                          Text(agenda.tanggal),
                          Text(agenda.unitPengundang),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgendaDetailPage(
                                id: agenda.idEvent,
                              ),
                            ));
                      },
                    );
                  },
                );
              }
              return const Text("Gagal Memuat Data");
            },
          ),
        ),
      ),
    );
  }
}
