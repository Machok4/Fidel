import 'dart:convert';

import 'package:acs314_project/models/money_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

var myMoneyList = [
  Money(
    whereSpent: "Groceries",
    amountSpent: 100,
    image: "assets/images/item_0.png",
  ),
  Money(
    whereSpent: "Transport",
    amountSpent: 200,
    image: "assets/images/item_1.png",
  ),
  Money(
    whereSpent: "Utilities",
    amountSpent: 300,
    image: "assets/images/item_2.png",
  ),
];

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  fetchMoney() async {
    var response = await http.get(
      Uri.parse("https://localhost/rootfolder/php.php"),
    );
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var moneyList = serverData["data"];
      for (var money in moneyList) ;
    } else {
      Get.snackbar("Error", "Server error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myMoneyList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Image.network(myMoneyList[index].image),
            Column(
              children: [
                Text(myMoneyList[index].whereSpent),
                Text(myMoneyList[index].amountSpent.toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}
