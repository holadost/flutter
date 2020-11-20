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
  var _value = "";
  var _rbValue1 = 0;
  var _rbValue2 = 0;
  var _cbValue1 = false;
  var _cbValue2 = false;

  void _setCbVal1(bool value) {
    setState(() => _cbValue1 = value);
  }
  void _setCbVal2(bool value) {
    setState(() => _cbValue2 = value);
  }

  void _setRbVal1(int value) {
    setState(() => _rbValue1 = value);
  }
  void _setRbVal2(int value) {
    setState(() => _rbValue2 = value);
  }

  Widget makeCheckboxes() {
    List cbList = new List<Widget>();
    for(int i = 0; i < 1; i++) {
      cbList.add(new Checkbox(value: _cbValue1, onChanged: _setCbVal1));
    }
    Column col = new Column(children: cbList);
    return col;
  }

  Widget makeCheckboxTileList() {
    var cbList = new List<Widget>();
    for(int i = 0; i < 3; i++) {
      cbList.add(new CheckboxListTile(
          value: _cbValue2,
          onChanged: _setCbVal2,
          controlAffinity: ListTileControlAffinity.leading, // Keep the checkbox on the left side.
          title: new Text("Hello Title!"),
          subtitle: new Text("Hello Subtitle"),
          secondary: new Icon(Icons.access_alarm, color: Colors.red,),
      ));
    }
    Column col = new Column(children: cbList);
    return col;
  }

  Widget makeRadioButtons() {
    List cbList = new List<Widget>();
    for(int i = 0; i < 1; i++) {
      cbList.add(new Radio(value: i, groupValue: _rbValue1, onChanged: _setRbVal1));
    }
    Column col = new Column(children: cbList);
    return col;
  }

  Widget makeRadioButtonTileList() {
    var cbList = new List<Widget>();
    for(int i = 0; i < 3; i++) {
      cbList.add(new RadioListTile(
        value: i,
        groupValue: _rbValue2,
        onChanged: _setRbVal2,
        controlAffinity: ListTileControlAffinity.trailing, // Keep the radio button on the right side.
        title: new Text("Hello Title!"),
        subtitle: new Text("Hello Subtitle"),
        secondary: new Icon(Icons.access_alarm, color: Colors.red,),
      ));
    }
    Column col = new Column(children: cbList);
    return col;
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
              makeCheckboxes(),
              makeCheckboxTileList(),
              makeRadioButtons(),
              makeRadioButtonTileList()
            ],
          ),
        ),
      ),
    );
  }
}
