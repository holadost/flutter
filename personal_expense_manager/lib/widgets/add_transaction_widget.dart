import 'package:flutter/material.dart';


class AddTransactionWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  AddTransactionWidget(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Amount"
                ),
                controller: amountController,
              ),
              FlatButton(
                onPressed: () {
                  addTx(titleController.text, double.parse(
                      amountController.text));
                },
                child: Text(
                    "Add transaction"),
                textColor: Colors.purple,
              )
            ],
          ),
        )
    );
  }
}
