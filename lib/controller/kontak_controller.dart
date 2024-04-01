import 'dart:io';
import 'dart:convert';

import 'package:praktikum5/model/person.dart';
import 'package:praktikum5/service/kontak_service.dart';
import 'package:flutter/material.dart';

class KontakController {
  final kontakService = KontakService();

  Future<Map<String, dynamic>> addPerson(Person person, File? file) async {
    Map<String, String> data = {
      "nama": person.nama,
      "email": person.email,
      "alamat": person.alamat,
      "telepon": person.tlp
    };

    try {
      var response = await kontakService.addPerson(data, file);
      if (response.statusCode == 201) {
        return {
          'success': true,
          "message": "Data berhasil disimpan",
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            "message": decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }

  Future<List<Person>> getPeople() async {
    try {
      List<dynamic> peopleData = await kontakService.fetchPeople();
      List<Person> people =
          peopleData.map((json) => Person.fromMap(json)).toList();
      return people;
    } catch (e) {
      throw Exception();
    }
  }
}
