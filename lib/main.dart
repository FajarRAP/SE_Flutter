import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_bloc/bloc/basa_bloc.dart';
import 'package:konsumsi_api_bloc/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasaBloc()..add(GetBasaEvent()),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
