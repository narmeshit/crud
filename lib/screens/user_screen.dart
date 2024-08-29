import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController _userController = UserController();

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final data = await _userController.fetchUsers();
    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APIs REST - Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.toString()),
            // subtitle: Text('${user.login.toString()}'),
            onTap: (){
              print(user.id);
            },
          );
        },
      ),
    );
  }
}
