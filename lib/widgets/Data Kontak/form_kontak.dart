import 'package:flutter/material.dart';

class FormKontak extends StatefulWidget {
  const FormKontak({
    super.key,
    required this.formKeyF,
    required this.namaF,
    required this.emailF,
    required this.alamatF,
    required this.noTlpnF,
  });

  final GlobalKey<FormState> formKeyF;
  final TextEditingController namaF;
  final TextEditingController emailF;
  final TextEditingController alamatF;
  final TextEditingController noTlpnF;

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyF,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: TextFormField(
                controller: widget.namaF,
                decoration: InputDecoration(
                    labelText: "Nama", hintText: "Masukkan nama"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: widget.emailF,
                decoration: InputDecoration(
                    labelText: "Email", hintText: "Masukan Email"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: widget.alamatF,
                decoration: InputDecoration(
                    labelText: "Alamat", hintText: "Masukan Alamat"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: widget.noTlpnF,
                decoration: InputDecoration(
                    labelText: "No Telepon", hintText: "Masukkan No HP"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
