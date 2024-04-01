import 'package:flutter/material.dart';
import 'package:praktikum5/controller/kontak_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final KontakController _controller = KontakController();
  @override
  void initState() {
    super.initState();
    _controller.getPeople();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar kontak"),),
    );
  }
}
