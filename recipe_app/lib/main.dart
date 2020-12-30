import 'package:flutter/material.dart';

import './screens/category_screen.dart';
import './screens/meal_screen.dart';
import './screens/categories_screen.dart';

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
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      // Routes are used to define the various routes/screens/endpoints in
      // our app. The home attribute can be used to define the home screen.
      // The home screen can likewise also be defined in the routes attribute
      // as well. On generate route can be used when we have dynamic routes.
      // Flutter first checks routes and if no route exists, it executes
      // onGenerateRoute and returns a screen if any. Otherwise, it returns
      // onUnknownRoute(if defined). If not defined, the app crashes.
      // home: CategoriesScreen(),
      //
      routes: {
        // Instead of defining a home attribute, we can directly
        // define the "/" which refers to home.
        "/": (ctx) => CategoriesScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        MealScreen.routeName: (ctx) => MealScreen()
      },
      onGenerateRoute: (settings) {
        print("Checking onGenerateRoute: ${settings.name}");
        return MaterialPageRoute(
            builder: (ctx) {
              return CategoriesScreen();
            });
      },
      onUnknownRoute: (settings) {
        print("Undefined route: ${settings.name}");
        return MaterialPageRoute(
            builder: (ctx) {
              return CategoriesScreen();
            });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text("My Recipes"),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Text("Navigation time!"),
      )
    );
  }
}
