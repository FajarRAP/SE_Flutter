import 'package:flutter/material.dart';

import 'core/constants_finals.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigateTo(namaPage: agendaRoute),
            NavigateTo(namaPage: gajiRoute),
            NavigateTo(namaPage: layananCutiRoute),
            NavigateTo(namaPage: monitoringRoute),
            NavigateTo(namaPage: shiftRoute),
            NavigateTo(namaPage: tunjanganRoute),
          ],
        ),
      ),
    );
  }
}

class NavigateTo extends StatelessWidget {
  final String namaPage;
  const NavigateTo({
    super.key,
    required this.namaPage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth / 2,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(namaPage),
            child: Text(namaPage),
          ),
        );
      },
    );
  }
}
