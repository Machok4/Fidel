import 'dart:convert';

import 'package:acs314_project/models/money_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


var myMoneyList = <Money>[];

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<void> fetchMoney() async {
    var response = await http.get(
      Uri.parse("https://localhost/rootfolder/php.php"),
    );
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var moneyList = serverData["data"];
      for (var money in moneyList) {
        // Future backend mapping here
      }
    } else {
      Get.snackbar("Error", "Server error");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myMoneyList.isEmpty
          ? const Center(child: Text("No expenses added yet"))
          : ListView.builder(
              itemCount: myMoneyList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(myMoneyList[index].whereSpent),
                    subtitle: Text("KSH ${myMoneyList[index].amountSpent}"),
                  ),
                );
              },
            ),
    );
  }
}
