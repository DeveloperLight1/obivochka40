import 'package:flutter/material.dart';
import 'main_screen.dart';

class TariffsScreen extends StatefulWidget {
  @override
  _TariffsScreenState createState() => _TariffsScreenState();
}

class _TariffsScreenState extends State<TariffsScreen> {
  String _selectedTariff = "";
  Color _activeButtonColor = Color(0xFF2579A4);
  Color _inactiveButtonColor = Colors.grey;
  Color _activeTariffColor = Color(0xFF2579A4);
  Color _inactiveTariffColor = Colors.white;
  Color _priceColor = Color(0xFF2579A4);
  Color _textColor = Colors.black;
  Color _activeTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Тарифы"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "У вас осталось 4 запроса",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            TariffCard(
              title: "5 запросов",
              price: "Пробная подписка",
              selected: _selectedTariff == "5 запросов",
              onTap: () {
                setState(() {
                  _selectedTariff = "5 запросов";
                });
              },
              isTrial: true,
              activeColor: _activeTariffColor,
              inactiveColor: _inactiveTariffColor,
              priceColor: _priceColor,
              textColor: _textColor,
              activeTextColor: _activeTextColor,
            ),
            TariffCard(
              title: "1 запрос",
              price: "129 ₽",
              selected: _selectedTariff == "1 запрос",
              onTap: () {
                setState(() {
                  _selectedTariff = "1 запрос";
                });
              },
              activeColor: _activeTariffColor,
              inactiveColor: _inactiveTariffColor,
              priceColor: _priceColor,
              textColor: _textColor,
              activeTextColor: _activeTextColor,
            ),
            TariffCard(
              title: "10 запросов",
              price: "990 ₽",
              selected: _selectedTariff == "10 запросов",
              onTap: () {
                setState(() {
                  _selectedTariff = "10 запросов";
                });
              },
              activeColor: _activeTariffColor,
              inactiveColor: _inactiveTariffColor,
              priceColor: _priceColor,
              textColor: _textColor,
              activeTextColor: _activeTextColor,
            ),
            TariffCard(
              title: "100 запросов",
              price: "6499 ₽",
              selected: _selectedTariff == "100 запросов",
              onTap: () {
                setState(() {
                  _selectedTariff = "100 запросов";
                });
              },
              activeColor: _activeTariffColor,
              inactiveColor: _inactiveTariffColor,
              priceColor: _priceColor,
              textColor: _textColor,
              activeTextColor: _activeTextColor,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 20.0,
                bottom: 40.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: _selectedTariff.isEmpty ? _inactiveButtonColor : _activeButtonColor,
                ),
                onPressed: _selectedTariff.isEmpty ? null : () {
                  // Действие по кнопке продолжить
                },
                child: Text(
                  "Продолжить",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TariffCard extends StatelessWidget {
  final String title;
  final String price;
  final bool selected;
  final bool isTrial;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;
  final Color priceColor;
  final Color textColor;
  final Color activeTextColor;

  const TariffCard({
    required this.title,
    required this.price,
    this.selected = false,
    this.isTrial = false,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
    required this.priceColor,
    required this.textColor,
    required this.activeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? activeColor : inactiveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selected ? activeTextColor : textColor,
            ),
          ),
          subtitle: Text(
            price,
            style: TextStyle(
              fontSize: 14,
              color: selected ? Colors.white : priceColor,
            ),
          ),
          trailing: Icon(Icons.check, color: selected ? Colors.white : Colors.grey),
          tileColor: selected ? activeColor.withOpacity(0.2) : null,
        ),
      ),
    );
  }
}
