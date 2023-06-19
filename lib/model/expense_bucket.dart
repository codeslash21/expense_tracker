import 'package:expense_tracker/model/expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> categoryExpense;
  final List<Expense> allExpenses;
  ExpenseBucket({required this.allExpenses, required this.category})
      : categoryExpense = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;
    for (Expense expense in categoryExpense) {
      sum += expense.amount;
    }
    return sum;
  }
}
