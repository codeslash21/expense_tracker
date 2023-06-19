import 'dart:async';

import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expense/expenses_list.dart';
import 'package:expense_tracker/widget/expense/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _addedExpenses = [
    Expense(
      title: "flutter course",
      amount: 19.99,
      category: Category.education,
      date: DateTime.now(),
    ),
    Expense(
      title: "KFC",
      amount: 50,
      date: DateTime.now(),
      category: Category.food,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _addedExpenses.add(expense);
    });
  }

  void _onRemoveExpense(Expense expense) {
    final expenseIndex = _addedExpenses.indexOf(expense);
    setState(() {
      _addedExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _addedExpenses.insert(expenseIndex, expense);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some!"),
    );
    if (_addedExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        addedExpenses: _addedExpenses,
        onRemoveExpense: _onRemoveExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(allExpenses: _addedExpenses),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
