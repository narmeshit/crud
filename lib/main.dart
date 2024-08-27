import 'package:flutter/material.dart';

import 'screens/producto_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: ProductoScreen(),
      ),
    );
  }
}
