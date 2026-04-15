import 'dart:convert';
import 'package:acs314_project/views/addexpense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/money_model.dart';


class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Money> expenses = [];
  bool isLoading = true;

  Future<void> fetchExpenses() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.11.28/rootfolder/get_expenses.php"),
      );

      if (response.statusCode != 200) {
        setState(() => isLoading = false);
        return;
      }

      final data = jsonDecode(response.body);

      if (data["success"] != 1) {
        setState(() => isLoading = false);
        return;
      }

      setState(() {
        expenses = (data["data"] as List)
            .map((item) => Money.fromJson(item))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Future<void> _goToAddExpense() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
    );

    if (result == true) {
      fetchExpenses();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Expenses")),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddExpense,
        child: const Icon(Icons.add),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : expenses.isEmpty
          ? const Center(child: Text("No expenses found"))
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final item = expenses[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(item.category[0].toUpperCase()),
                    ),
                    title: Text(item.title),
                    subtitle: Text("${item.category} | ${item.expenseDate}"),
                    trailing: Text(
                      "KSH ${item.amount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
