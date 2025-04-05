import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FilterScreen(),
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double seats = 3;
  String mechanism = 'Пружинный';
  String? country;
  bool hasLight = false;

  Map<String, bool> covers = {
    'Всё': false,
    'Подушки': false,
    'Сиденье': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтр'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: ListView(
            children: [
              const Text('Диван (мест)', style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: seats,
                min: 1,
                max: 7,
                divisions: 6,
                label: '${seats.round()}',
                onChanged: (value) {
                  setState(() {
                    seats = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text('Механизм', style: TextStyle(fontWeight: FontWeight.bold)),
              RadioListTile(
                title: const Text('Пружинный'),
                value: 'Пружинный',
                groupValue: mechanism,
                onChanged: (value) {
                  setState(() => mechanism = value!);
                },
              ),
              RadioListTile(
                title: const Text('Пружинный 2'),
                value: 'Пружинный 2',
                groupValue: mechanism,
                onChanged: (value) {
                  setState(() => mechanism = value!);
                },
              ),
              RadioListTile(
                title: const Text('Пружинный 3'),
                value: 'Пружинный 3',
                groupValue: mechanism,
                onChanged: (value) {
                  setState(() => mechanism = value!);
                },
              ),
              const SizedBox(height: 10),
              const Text('Страна производитель', style: TextStyle(fontWeight: FontWeight.bold)),
              for (var c in ['Россия', 'Беларусь', 'Польша', 'Германия', 'США'])
                RadioListTile(
                  title: Text(c),
                  value: c,
                  groupValue: country,
                  onChanged: (value) {
                    setState(() => country = value);
                  },
                ),
              const Divider(),
              SwitchListTile(
                title: const Text('Подсветка'),
                value: hasLight,
                onChanged: (val) => setState(() => hasLight = val),
              ),
              const Divider(),
              const Text('На чехлах', style: TextStyle(fontWeight: FontWeight.bold)),
              ...covers.keys.map((key) => CheckboxListTile(
                title: Text(key),
                value: covers[key],
                onChanged: (val) {
                  setState(() => covers[key] = val!);
                },
              )),
            ],
          ),
        ),
      ),
      // Удаляем этот блок для того, чтобы убрать нижние кнопки
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.music_note), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
      //   ],
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }
}
