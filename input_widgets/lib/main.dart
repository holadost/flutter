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
  var _textValue = "";
  var _value = "";

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
              new TextField(
                decoration: new InputDecoration(
                    labelText: 'Hello',
                    hintText: "Enter your name",
                    icon: new Icon(Icons.people)
                ),
                autocorrect: true, // Auto correct text.
                autofocus: true, // Focus on the text.
                keyboardType: TextInputType.text, // Make the keyboard a text type.
                onChanged: _onTextFieldChange, // Function to do something as the text is changing. For ex: Show options
                onSubmitted: _onTextFieldSubmit, // Function to do something after a text has been submitted
              )
            ],
          ),
        ),
      ),
    );
  }
}
