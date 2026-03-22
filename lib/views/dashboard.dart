import 'package:flutter/material.dart';

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
              crossAxisCount: 2, // two cards per row
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconData[index], size: 40, color: Colors.white),
                    const SizedBox(height: 8),
                    Text(
                      titles[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      values[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
