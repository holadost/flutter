import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/add_transaction_widget.dart';
import './widgets/expenses_chart_widget.dart';
import './widgets/transactions_widget.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      // Check this out on how to create an app wide theme.
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amberAccent,
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _showChart = true;

  // TODO: Figure out how list properties work.
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransactions(String title, double amount, DateTime curr) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: curr,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
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
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("My Expenses"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context))
      ],
    );
    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
            0.6,
        child: TransactionsWidget(
            _userTransactions, _deleteTransactions));
    final chartWidget = Container(
        height: (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
            0.4,
        child: ExpensesChart(_recentTransactions));

    return Scaffold(
      appBar: appBar,
      body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (isLandscape) Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Show Chart"),
                    Switch(value: _showChart, onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
                  ],
                ),
                if (isLandscape)
                _showChart ? chartWidget: txListWidget, // We are in landscape mode. Show either the chart of list,
                if (!isLandscape)
                  chartWidget, // Portrait mode. Show chart.
                if (!isLandscape)
                  txListWidget, // Portrait mode. Show list.
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
