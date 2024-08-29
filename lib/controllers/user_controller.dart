import 'package:crud/services/user_service.dart';

import '../models/user.dart';

class UserController {
  final UserService _userService = UserService();

  Future<List<User>> fetchUsers() async {
    return await _userService.getUsers();
  }
}