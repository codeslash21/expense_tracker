import 'package:expense_tracker/model/expense_bucket.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final ExpenseBucket expenseBucket;
  final double totalExpenses;
  final double fill;
  ChartBar(
      {super.key, required this.expenseBucket, required this.totalExpenses})
      : fill = expenseBucket.totalExpense / totalExpenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: Color.fromARGB(255, 176, 62, 220),
            ),
          ),
        ),
      ),
    );
  }
}
