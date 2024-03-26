import 'package:flutter/material.dart';

class FooterKontak extends StatefulWidget {
  const FooterKontak({super.key});

  @override
  State<FooterKontak> createState() => _FooterKontakState();
}

class _FooterKontakState extends State<FooterKontak> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text("Pilih Gambar"),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Simpan"),
        ),
      ],
    );
  }
}
