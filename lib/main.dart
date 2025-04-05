import 'package:flutter/material.dart';
import '/screens/login_screen.dart'; // Импортируем экран для регистрации/входа

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Обивочка',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Устанавливаем экран логина первым
      debugShowCheckedModeBanner: false,
    );
  }
}
