import 'package:flutter/material.dart';
import 'dart:ui'; // Для использования ImageFilter

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final Map<String, String> characteristics;

  const ProductDetailScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.characteristics,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _hasSubscription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение товара
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Название товара
            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Описание товара
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Характеристики:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Контейнер для характеристик
            Stack(
              children: [
                // Характеристики без блюра
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.characteristics.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
                // Добавляем слой с затемнением, если нет подписки
                if (!_hasSubscription)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 16),
            // Блок с кнопкой подписки, если её нет
            if (!_hasSubscription)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Иконка замка с открытой дверью сверху
                    Column(
                      children: [
                        Icon(
                          Icons.lock_open, // Иконка открытого замка
                          color: Color(0xFF2579A4), // Цвет иконки
                          size: 24, // Размер иконки
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'У Вас нет запросов.',
                          style: TextStyle(
                            color: Color(0xFF2579A4), // Цвет для текста "У Вас нет запросов"
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Следующий текст с черным цветом
                    Text(
                      'Приобретите подписку, чтобы ознакомиться с характеристиками и стоимостью.',
                      style: TextStyle(
                        color: Colors.black, // Черный цвет для текста
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasSubscription = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Color(0xFF2579A4), // Цвет кнопки
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Выбрать подписку',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            // Остальной текст будет белым
            if (_hasSubscription)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Теперь вы можете просматривать характеристики и стоимость товара.',
                  style: TextStyle(
                    color: Colors.white, // Белый цвет для остального текста
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
