import 'package:flutter/material.dart';
import 'package:personal_expense_manager/widgets/add_transaction_widget.dart';
import 'package:personal_expense_manager/widgets/transactions_widget.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: AddTransactionWidget(_addNewTransactions),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Colors.blue,
                    child: Text(
                      "Chart Area",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    elevation: 10,
                  ),
                ),
                TransactionsWidget(_userTransactions)
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
