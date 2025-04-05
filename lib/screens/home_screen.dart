import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'filter_screen.dart';
import 'category_items_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'title': 'Кресла', 'image': 'assets/images/chairs/chair.png'},
      {'title': 'Кровати', 'image': 'assets/images/beds/bed.png'},
      {'title': 'Стулья', 'image': 'assets/images/stuls/stul.png'},
      {'title': 'Кресло офисное', 'image': 'assets/images/office_chairs/office_chair.png'},
      {'title': 'Диван кухонный', 'image': 'assets/images/kitchen_sofas/kitchen_sofa.png'},
      {'title': 'Банкетки', 'image': 'assets/images/banquets/banquet.png'},
      {'title': 'Пуфики', 'image': 'assets/images/pufics/pufic.png'},
      {'title': 'Винтажная мебель', 'image': 'assets/images/vintages/vintage.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Например, Диван-честер',
                        prefixIcon: Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Переход к экрану фильтра
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Категории',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              // Сетка категорий
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return GestureDetector(
                      onTap: () {
                        // Открытие экрана с товарами категории
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryItemsScreen(category: item),
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
                                item['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
