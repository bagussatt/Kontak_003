// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Person {
  final String nama;
  final String email;
  final String alamat;
  final String tlp;
  final String foto;
  Person({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.tlp,
    required this.foto,
  });

  Person copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? tlp,
    String? foto,
  }) {
    return Person(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      tlp: tlp ?? this.tlp,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'tlp': tlp,
      'foto': foto,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      tlp: map['tlp'] as String,
      foto: map['foto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(nama: $nama, email: $email, alamat: $alamat, tlp: $tlp, foto: $foto)';
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;
  
    return 
      other.nama == nama &&
      other.email == email &&
      other.alamat == alamat &&
      other.tlp == tlp &&
      other.foto == foto;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
      email.hashCode ^
      alamat.hashCode ^
      tlp.hashCode ^
      foto.hashCode;
  }
}
