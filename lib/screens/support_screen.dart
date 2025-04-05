import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Контент будет располагаться за AppBar
      backgroundColor: Color(0xFFF8F8F8), // Фон всего экрана
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Color(0xFFF8F8F8), // Устанавливаем тот же цвет для AppBar
          elevation: 0, // Без тени
          title: Text(
            "Поддержка",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1D1D1D), // Черный текст
            ),
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: Color(0xFF1D1D1D)), // Черные иконки
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: ListView(
          children: [
            CustomPadding(
              top: 20,
              bottom: 0,
              child: Text(
                "Свяжитесь с нами если у Вас возникли вопросы или проблема.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            CustomPadding(
              top: 20,
              bottom: 0,
              child: Text(
                "Позвонить по номеру:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            CustomPadding(
              top: 20,
              bottom: 0,
              child: SupportButton(
                text: "+7 495 755-69-83",
                icon: Image.asset('assets/icons/phone_white.png', width: 20, height: 20),
                color: Colors.blue,
                textColor: Colors.white,
                fontSize: 16, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Увеличиваем закругление
              ),
            ),
            CustomPadding(
              top: 20,
              bottom: 10,
              child: SupportButton(
                text: "+7 495 755-69-83",
                icon: Image.asset('assets/icons/phone_blue.png', width: 20, height: 20),
                color: Colors.white,
                textColor: Colors.black,
                borderColor: Colors.blue,
                fontSize: 16, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Увеличиваем закругление
              ),
            ),
            CustomPadding(
              top: 20,
              bottom: 10,
              child: Text(
                "Также, можете связаться с нами в мессенджерах:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CustomPadding(
              top: 10,
              bottom: 10,
              child: SupportButton(
                text: "ВКонтакте",
                icon: Image.asset('assets/icons/vk.png', width: 20, height: 20),
                color: Colors.blue,
                textColor: Colors.white,
                fontSize: 18, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Оставляем стандартное закругление
              ),
            ),
            CustomPadding(
              top: 10,
              bottom: 10,
              child: SupportButton(
                text: "WhatsApp",
                icon: Image.asset('assets/icons/whatsapp.png', width: 20, height: 20),
                color: Colors.green,
                textColor: Colors.white,
                fontSize: 18, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Оставляем стандартное закругление
              ),
            ),
            CustomPadding(
              top: 10,
              bottom: 10,
              child: SupportButton(
                text: "Rutube",
                icon: Image.asset('assets/icons/rutube.png', width: 20, height: 20),
                color: Colors.black,
                textColor: Colors.white,
                fontSize: 18, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Оставляем стандартное закругление
              ),
            ),
            CustomPadding(
              top: 10,
              bottom: 10,
              child: SupportButton(
                text: "Telegram",
                icon: Image.asset('assets/icons/telegram.png', width: 20, height: 20),
                color: Colors.lightBlue,
                textColor: Colors.white,
                fontSize: 18, // Устанавливаем размер шрифта
                borderRadius: BorderRadius.circular(30), // Оставляем стандартное закругление
              ),
            ),
            CustomPadding(
              top: 20,
              bottom: 8,
              child: Text(
                "О компании",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CustomPadding(
              top: 8,
              bottom: 10,
              child: Text(
                "Наша компания специализируется на перетяжке мебели.Наша компания специализируется на перетяжке мебели.Наша компания специализируется на перетяжке мебели.Наша компания специализируется на перетяжке мебели.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final double fontSize; // Добавлен параметр fontSize
  final BorderRadius borderRadius; // Добавлен параметр borderRadius

  const SupportButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
    this.borderColor,
    required this.fontSize, // Добавлен параметр fontSize
    required this.borderRadius, // Добавлен параметр borderRadius
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: icon,
        label: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize), // Устанавливаем размер шрифта
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 12),
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius, // Используем новый параметр borderRadius
          ),
        ),
      ),
    );
  }
}

class CustomPadding extends StatelessWidget {
  final Widget child;
  final double top;
  final double bottom;
  final double left;
  final double right;

  const CustomPadding({
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: child,
    );
  }
}
