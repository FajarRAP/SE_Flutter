import 'package:flutter/material.dart';
import 'pages/agenda_pages_origin.dart';
import 'pages/agenda_pages.dart';
import 'pages/another_agenda_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Konsumsi Agenda",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AgendaAinx(),
    );
  }
}

// class ResponsiveApp {
//   static MediaQueryData _mediaQueryData;

//   MediaQueryData get mq => _mediaQueryData;

//   static void setMq(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//   }
// }
