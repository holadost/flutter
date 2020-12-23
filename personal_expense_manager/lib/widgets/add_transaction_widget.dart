import 'package:flutter/material.dart';

class AddTransactionWidget extends StatefulWidget {
  final Function addTx;
  AddTransactionWidget(this.addTx);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      print("Invalid inputs while entering transaction");
      return;
    }
    // The state object can access the widget whose state it
    // manages by using the magic 'widget' object allowing us
    // to access methods/members from the widget.
    widget.addTx(title, amount);
    // Close the modal screen after we have finished entering
    // the transaction.
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Amount"
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                onPressed: submitData,
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
