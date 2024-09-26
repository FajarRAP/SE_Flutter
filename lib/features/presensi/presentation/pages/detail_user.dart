import 'package:flutter/material.dart';

class DetailUser extends StatefulWidget {
  const DetailUser({super.key});
  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}