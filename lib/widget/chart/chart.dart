import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_bucket.dart';

class Chart extends StatelessWidget {
  final List<Expense> allExpenses;
  Chart({super.key, required this.allExpenses});

  List<ExpenseBucket> get bucketList {
    return [
      ExpenseBucket(allExpenses: allExpenses, category: Category.education),
      ExpenseBucket(allExpenses: allExpenses, category: Category.food),
      ExpenseBucket(allExpenses: allExpenses, category: Category.leisure),
      ExpenseBucket(allExpenses: allExpenses, category: Category.travel),
      ExpenseBucket(allExpenses: allExpenses, category: Category.work)
    ];
  }

  double get totalExpenses {
    double totalExpenses = 0;
    for (ExpenseBucket bucket in bucketList) {
      totalExpenses += bucket.totalExpense;
    }
    return totalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 219, 154, 234),
            Color.fromARGB(255, 209, 120, 233)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in bucketList) // alternative to map()
                  ChartBar(
                    expenseBucket: bucket,
                    totalExpenses: totalExpenses,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: bucketList // for ... in
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: Color.fromARGB(255, 209, 76, 226),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
