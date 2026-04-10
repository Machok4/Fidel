import 'package:flutter/material.dart';
import 'package:acs314_project/views/list.dart';
import 'package:acs314_project/models/money_model.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  AddExpenseScreenState createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  double amount = 0;
  String category = 'Food';
  DateTime selectedDate = DateTime.now();

  final List<String> _categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Shopping',
    'Bills',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) => amount = double.tryParse(value) ?? 0,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter amount' : null,
              ),
              DropdownButtonFormField<String>(
                value: category,
                items: _categories.map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => category = value);
                  }
                },
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              ListTile(
                title: const Text('Date'),
                subtitle: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => selectedDate = picked);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Save Expense'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                    myMoneyList.add(
                      Money(
                        whereSpent: title,
                        amountSpent: amount,
                        image: "assets/images/item_0.png",
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Expense Saved")),
                    );

                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
