// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class person {
  final String nama;
  final String email;
  final String alamat;
  final String tlp;
  person({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.tlp,
  });

  person copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? tlp,
  }) {
    return person(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      tlp: tlp ?? this.tlp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'tlp': tlp,
    };
  }

  factory person.fromMap(Map<String, dynamic> map) {
    return person(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      tlp: map['tlp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory person.fromJson(String source) => person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'person(nama: $nama, email: $email, alamat: $alamat, tlp: $tlp)';
  }

  @override
  bool operator ==(covariant person other) {
    if (identical(this, other)) return true;
  
    return 
      other.nama == nama &&
      other.email == email &&
      other.alamat == alamat &&
      other.tlp == tlp;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
      email.hashCode ^
      alamat.hashCode ^
      tlp.hashCode;
  }
}
