import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {

  String _value = "Value 1";
  var _textValue = "";
  var _numValue = 0;

  void _onClick() {
    setState(() {
      _value = "My name is nikhil";
    });
  }

  void _onPressed(String givenValue) {
    setState(() {
      _value = "Hello $givenValue";
    });
  }

  void _onCounterIncPressed() {
    setState(() {
      _numValue += 1;
    });
  }

  void _onCounterDecPressed() {
    setState(() {
      _numValue -= 1;
    });
  }

  void _onTextFieldChange(String givenValue) {
    setState(() {
      _value = "Changed value: $givenValue";
    });
  }

  void _onTextFieldSubmit(String givenValue) {
    setState(() {
      _value = "Submitted value: $givenValue";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyApp object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("App bar title"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),

        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              new Text(_value),
              // Check out how to use buttons here.
              // Note: onPressed takes a function object. To create function objects,
              // take a look at the syntax below.
              new RaisedButton(onPressed: _onClick, child: new Text("Click me 1"),),
              new RaisedButton(onPressed: () => _onPressed("raised button"), child: new Text("Click me 2"),),
              new FlatButton(onPressed: () => _onPressed("flat button"), child: new Text("Click me 3"),),
              new Text(_numValue.toString()),
              new IconButton(icon: new Icon(Icons.add), onPressed: () => _onCounterIncPressed()),
              new IconButton(icon: new Icon(Icons.remove), onPressed: () => _onCounterDecPressed()),
            ],
          ),
        ),
      ),
    );
  }
}
