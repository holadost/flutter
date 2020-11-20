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
  var _switchValue1 = false;
  var _switchValue2 = false;
  var _textVal = "Turn on lights";
  var _sliderVal = 0.0;
  var _sliderValStr = "";

  // Widget reactors.
  void _onChangedSw1(bool value) => setState(() => _switchValue1 = value);

  void _onChangedSw2(bool value) {
    setState(() {
      _switchValue2 = value;
      if (_switchValue2) {
        _textVal = "Turn off lights";
      } else {
        _textVal = "Turn on lights";
      }
    });
  }

  void _onChangeSlider(double val) {
    setState(() {
      _sliderVal = val;
      _sliderValStr = "Volume: " + (_sliderVal * 100).round().toString();
    });
  }

  // Widget constructors.
  Widget makeSwitch() {
    var list = new List<Widget>();
    for(int i = 0; i < 1; i++) {
      list.add(new Switch(value: _switchValue1, onChanged: _onChangedSw1));
    }
    Column col = new Column(children: list);
    return col;
  }

  Widget makeSwitchTile() {
    var list = new List<Widget>();
    for(int i = 0; i < 1; i++) {
      list.add(new SwitchListTile(
        value: _switchValue2, 
        onChanged: _onChangedSw2, 
        controlAffinity: ListTileControlAffinity.leading,
        title: new Text(
          _textVal,
          style: new TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold),),
        ));
    }
    Column col = new Column(children: list);
    return col;
  }

  Widget makeSlider() {
    var list = new List<Widget>();
    for(int i = 0; i < 1; i++) {
      list.add(new Text(_sliderValStr));
      list.add(new Slider(value: _sliderVal, onChanged: _onChangeSlider));
    }
    Column col = new Column(children: list);
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
              makeSwitch(),
              makeSwitchTile(),
              makeSlider()
            ],
          ),
        ),
      ),
    );
  }
}
