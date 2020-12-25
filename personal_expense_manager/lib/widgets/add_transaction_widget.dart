import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionWidget extends StatefulWidget {
  final Function addTx;
  AddTransactionWidget(this.addTx);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(context: context,
        initialDate: DateTime.now(), firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((value) {
          if (value != null) {
            setState(() {
              _selectedDate = value;
            });
          } else {
            return;
          }
    });
  }

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      print("Invalid inputs while entering transaction");
      return;
    }
    // The state object can access the widget whose state it
    // manages by using the magic 'widget' object allowing us
    // to access methods/members from the widget.
    widget.addTx(title, amount, _selectedDate);
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
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Amount"
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selectedDate == null ?
                        "No date chosen" :
                        "Picked Date: " + DateFormat.yMd().format(_selectedDate),
                          style: TextStyle(
                              color: Colors.red
                          ),
                        )
                    ),
                    FlatButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          'Choose date',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        )
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: _submitData,
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
