import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class CategoryItemsScreen extends StatelessWidget {
  final Map<String, String> category;

  const CategoryItemsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'title': 'Кресло 1', 'image': 'assets/images/chairs/chair.png'},
      {'title': 'Кресло 2', 'image': 'assets/images/chairs/chair.png'},
      {'title': 'Кресло 3', 'image': 'assets/images/chairs/chair.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category['title']!),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        title: product['title']!,
                        imagePath: product['image']!,
                        description: 'Описание товара',
                        characteristics: {
                          'Цвет': 'Серый',
                          'Материал': 'Велюр',
                          'Ширина': '80 см',
                          'Цена': '24 900 ₽',
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['title']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
