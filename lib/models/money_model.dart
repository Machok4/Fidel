class Money {
  String title;
  double amount;
  String category;
  String expenseDate;

  Money({
    required this.title,
    required this.amount,
    required this.category,
    required this.expenseDate,
  });

  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      title: json["title"] ?? "",
      amount: double.parse(json["amount"].toString()),
      category: json["category"] ?? "",
      expenseDate: json["expense_date"] ?? "",
    );
  }
}
