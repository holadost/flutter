import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsWidget extends StatelessWidget {
  final List<Transaction> _allTransactions;
  TransactionsWidget(this._allTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _allTransactions.isEmpty ? Column(
        children: [
          Text("No transactions currently. Add one :)",
            style: Theme.of(context).textTheme.title,),
          SizedBox(
            height: 20,
          ), // Sized boxes can be used to provide spacing.
          Container(
            height: 200,
            child:  Image.asset(
                "assets/images/waiting.png", // Also add image to pubspec.yaml.
                fit: BoxFit.cover), // fit is used to make the image fit the container
          ),

        ],
      ) : ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "\$" + _allTransactions[idx].amount.toStringAsPrecision(4),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 20),
                    ),
                    decoration: BoxDecoration(border: Border.all(
                        color: Theme.of(context).primaryColor, // Look at ThemeData in main.dart.
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
                        _allTransactions[idx].title,
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().add_jm().format(
                            _allTransactions[idx].date),
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
        },
        itemCount: _allTransactions.length,
      ),
    );
  }
}
