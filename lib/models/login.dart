// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Login {
  final String uuid;
  final String username;
  final String password;
  final String md5;
  final String sha1;
  final DateTime registered;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.md5,
    required this.sha1,
    required this.registered,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'username': username,
      'password': password,
      'md5': md5,
      'sha1': sha1,
      'registered': registered.toIso8601String(),
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      uuid: map['uuid'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      md5: map['md5'] as String,
      sha1: map['sha1'] as String,
      registered: DateTime.parse(map['registered']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Login(uuid: $uuid, username: $username, password: $password, md5: $md5, sha1: $sha1, registered: $registered)';
  }
}
