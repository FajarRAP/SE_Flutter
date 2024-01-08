import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:konsumsi_api_agenda/agenda/bloc/agenda_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_agenda/agenda/pages/agenda-detail_pages.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBloc = AgendaBloc(); // BLoC yang berbeda dengan yang di agenda-detail
    final TextEditingController namaController = TextEditingController();
    String inputKata = "";
    String inputDate = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsumsi Agenda"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showMonthPicker(
                  context: context,
                  initialDate: DateTime.now(),
                ).then((date) {
                  if (date != null) {
                    inputDate = DateFormat("yyyy-MM-dd").format(date);
                    dataBloc
                        .add(GetAgendaEvent(kata: inputKata, date: inputDate));
                    namaController.text = "";
                  }
                });
              },
              child: const Text("Bulan"),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
              onChanged: (value) {
                inputKata = value;
                dataBloc.add(GetAgendaEvent(kata: inputKata, date: inputDate));
              },
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  dataBloc
                      .add(GetAgendaEvent(kata: inputKata, date: inputDate));
                },
                child: BlocBuilder<AgendaBloc, AgendaState>(
                  bloc: dataBloc
                    ..add(GetAgendaEvent(kata: inputKata, date: inputDate)),
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
                                ),
                              );
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
          ],
        ),
      ),
    );
  }
}
