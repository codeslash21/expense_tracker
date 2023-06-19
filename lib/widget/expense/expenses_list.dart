import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/expense/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> addedExpenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.addedExpenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addedExpenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(addedExpenses[index]),
          onDismissed: (direction) => onRemoveExpense(addedExpenses[index]),
          child: ExpenseItem(expense: addedExpenses[index])),
    );
  }
}
