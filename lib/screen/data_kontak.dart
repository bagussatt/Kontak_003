import 'package:flutter/material.dart';
import 'package:praktikum5/widgets/Data%20Kontak/footer_kontak.dart';
import 'package:praktikum5/widgets/Data%20Kontak/form_kontak.dart';

class DataKontak extends StatelessWidget {
  const DataKontak({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nama = TextEditingController();
    var email = TextEditingController();
    var notlp = TextEditingController();
    var alamat = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Data Kontak')),
      ),
      body:  Center(
        child: Column(
          children: [FormKontak(
            formKeyF: formKey,
            namaF: nama,
            emailF: email,
            noTlpnF: notlp,
            alamatF: alamat,
          ), FooterKontak()],
        ),
      ),
    );
  }
}
