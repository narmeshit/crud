// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'address.dart';
import 'company.dart';
import 'login.dart';

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final DateTime birthDate;
  final Login login;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.birthDate,
    required this.login,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // birthDate.toIso8601String()

  // DateTime.parse(map['birthDate']),




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'birthDate': birthDate.toIso8601String(),
      'login': login.toMap(),
      'address': address.toMap(),
      'phone': phone,
      'website': website,
      'company': company.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      birthDate: DateTime.parse(map['birthDate']),
      login: Login.fromMap(map['login'] as Map<String,dynamic>),
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
      phone: map['phone'] as String,
      website: map['website'] as String,
      company: Company.fromMap(map['company'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstname: $firstname, lastname: $lastname, email: $email, birthDate: $birthDate, login: $login, address: $address, phone: $phone, website: $website, company: $company)';
  }
}
