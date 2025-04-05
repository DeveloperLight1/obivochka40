import 'package:flutter/material.dart';
import 'main_screen.dart'; // Импортируем MainScreen

class EnterScreen extends StatefulWidget {
  @override
  _EnterScreenState createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  bool _obscurePassword = true;
  bool _stayLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Фоновое изображение с затемнением
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/enter_bg.jpg'), // Добавь изображение фона
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Контент
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ВХОД',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500, // Medium жирность
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildTextField(
                    hint: 'Введите номер телефона',
                    icon: null,
                    obscureText: false,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    hint: 'Введите пароль',
                    icon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    obscureText: _obscurePassword,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _stayLoggedIn,
                        onChanged: (value) {
                          setState(() => _stayLoggedIn = value ?? false);
                        },
                        side: BorderSide(color: Colors.white70),
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      Text(
                        'Не выходить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Переход на MainScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.blue.shade600,
                    ),
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500, // Medium жирность
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      // Переход к восстановлению пароля
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Забыли пароль? ',
                        style: TextStyle(color: Colors.white70),
                        children: [
                          TextSpan(
                            text: 'Восстановить',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    Widget? icon,
    required bool obscureText,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
