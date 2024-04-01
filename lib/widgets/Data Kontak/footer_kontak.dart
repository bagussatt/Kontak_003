import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:praktikum5/model/person.dart';
import 'package:praktikum5/controller/kontak_controller.dart';
import 'package:praktikum5/screen/home_view.dart';

class FooterKontak extends StatefulWidget {
  const FooterKontak({super.key, required this.formKeyF, required this.namaF, required this.emailF, required this.alamatF, required this.noTlpnF});
    final GlobalKey<FormState> formKeyF;
  final TextEditingController namaF;
  final TextEditingController emailF;
  final TextEditingController alamatF;
  final TextEditingController noTlpnF;


  @override
  State<FooterKontak> createState() => _FooterKontakState();
}

class _FooterKontakState extends State<FooterKontak> {
 File? _image;
  final _imagePicker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("No image selected");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
        _image == null
                ? const Text("Belum ada gambar yang dipilih")
                : Image.file(_image!),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Pilih Gambar"),
            ),
        SizedBox(height: 20),

        SizedBox(
          height: 20,
        ),
     Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    if (widget.formKeyF.currentState!.validate()) {
                      var result = await KontakController().addPerson(
                        Person(
                            nama: widget.namaF.text,
                            email: widget.emailF.text,
                            alamat: widget.alamatF.text,
                            tlp: widget.noTlpnF.text,
                            foto: _image!.path),
                        _image,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result['message'],
                          ),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text("Simpan")),
            ),
      ],
    );
  }
}
