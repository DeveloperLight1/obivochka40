import 'package:flutter/material.dart';
import 'registration_screen.dart'; // Импортируем экран регистрации
import 'enter_screen.dart'; // Импортируем экран войти
import 'main_screen.dart'; // Если нужно, импортируйте главный экран

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Задний фон (картинка)
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',  // Укажите свой путь к изображению
              fit: BoxFit.cover,  // Заполнение всего экрана
            ),
          ),

          // Полупрозрачный слой поверх изображения для улучшения читаемости
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Черный фон с полупрозрачностью
            ),
          ),

          // Содержимое экрана
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Заголовок экрана
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Кнопка "Регистрация"
                  ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку Регистрация
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationScreen()), // Переход на экран регистрации
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,  // Прозрачный фон
                      side: BorderSide(color: Colors.white), // Белая рамка
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,  // Белый цвет текста
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Кнопка "Войти"
                  ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку Войти
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EnterScreen()), // Переход на главный экран
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2579A4),  // Цвет кнопки для "Войти"
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,  // Белый цвет текста
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
