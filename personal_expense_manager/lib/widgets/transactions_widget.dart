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
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "\$" + _allTransactions[idx].amount.toString(),
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
                        _allTransactions[idx].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green,
                            fontStyle: FontStyle.italic
                        ),
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
