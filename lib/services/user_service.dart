import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService {
  final String apiUrl = "https://jsonplaceholder.org/users";

  Future<List<User>> getUsers() async {
    final res = await http.get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      // List<User> users = body.map((dynamic data) => User.fromMap(data)).toList();
      List<User> users =
          body.map((user) => User.fromMap(user)).toList();

      return users;
    } else {
      throw Exception('Error al cargar los usuarios');
    }
  }
}
