import 'package:flutter/material.dart';
import './add_transaction_widget.dart';
import './transactions_widget.dart';
import '../models/transaction.dart';

class MainTransactionsWidget extends StatefulWidget {
  @override
  _MainTransactionsWidgetState createState() => _MainTransactionsWidgetState();
}

class _MainTransactionsWidgetState extends State<MainTransactionsWidget> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "1", title: "New Shoes", amount: 69.99,
        date: DateTime.now()),
    Transaction(id: "2", title: "Groceries", amount: 29.76,
        date: DateTime.now()),
    Transaction(id: "3", title: "Other stuff", amount: 19.22,
        date: DateTime.now())
  ];

  void _addNewTransactions(String title, double amount) {
    final newTx = Transaction(title: title, amount: amount,
        date: DateTime.now(), id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransactionWidget(_addNewTransactions),
        TransactionsWidget(_userTransactions)
      ],
    );
  }
}
