import 'package:flutter/material.dart';
import 'support_screen.dart';
import 'tariffs_screen.dart';
import 'favorites_screen.dart';
import 'filter_screen.dart'; // Экран фильтра
import 'home_screen.dart';   // Главный экран (HomeScreen) с поиском и фильтром

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
      // Используем маршруты: главный экран – HomeScreen (включён в нижнее меню), а фильтр – отдельный маршрут.
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/filter': (context) => FilterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Список экранов для нижнего меню
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),       // Главный экран с поиском, категориями и кнопкой фильтра
    SupportScreen(),    // Экран поддержки
    FavoritesScreen(),  // Экран избранного
    TariffsScreen(),    // Экран тарифов
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 22, height: 24),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/support.png', width: 24, height: 24),
            label: 'Поддержка',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/favorite.png', width: 27, height: 24),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/tarifs.png', width: 12, height: 22),
            label: 'Тарифы',
          ),
        ],
      ),
    );
  }
}
