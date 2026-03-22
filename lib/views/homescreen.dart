import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:acs314_project/views/add.dart';
import 'package:acs314_project/views/list.dart';
import 'package:acs314_project/views/profile.dart';

final List<String> titles = [
  "Amount Available",
  "Amount Spent",
  "Amount Loaned",
  "Amount Saved"
];

final List<IconData> iconData = [
  Icons.account_balance_wallet,
  Icons.shopping_cart,
  Icons.credit_card,
  Icons.savings
];

final List<String> values = [
  "KSH 10,000.00",
  "KSH 35,000.00",
  "KSH 2,000.00",
  "KSH 10,000.00"
];

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const AddPage(),
    const ListPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Hello Fidel',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: titles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconData[index], size: 30, color: Colors.white),
                      Text(titles[index],
                          style: const TextStyle(color: Colors.white)),
                      Text(values[index],
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
