import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "1", title: "New Shoes", amount: 69.99,
        date: DateTime.now()),
    Transaction(id: "2", title: "Groceries", amount: 29.76,
        date: DateTime.now()),
    Transaction(id: "3", title: "Other stuff", amount: 19.22,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenses"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                elevation: 10,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Title"
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Amount"
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                            "Add transaction"),
                        textColor: Colors.purple,
                    )
                  ],
                ),
              )
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "\$" + tx.amount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 20),
                          ),
                          decoration: BoxDecoration(border: Border.all(
                            color: Colors.purple,
                            width: 2)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15),
                          padding: EdgeInsets.all(5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green,
                                fontStyle: FontStyle.italic
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              DateFormat.yMMMMEEEEd().add_jm().format(tx.date),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                      ],
                    ));
              }).toList(),
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
      )
    );
  }
}
