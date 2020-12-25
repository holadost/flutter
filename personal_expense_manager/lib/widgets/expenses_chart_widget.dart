import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  ExpensesChart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final current = DateTime.now().subtract(Duration(days: index));
      double sum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if ((recentTransactions[i].date.day == current.day) &&
            (recentTransactions[i].date.month == current.month) &&
            (recentTransactions[i].date.year == current.year)) {
          sum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(current), 'amount': sum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
