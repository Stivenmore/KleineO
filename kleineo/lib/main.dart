import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Models/Inherited.dart';
import 'package:kleineo/Routes/routes.dart';
import 'package:kleineo/Utils/ThemeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = DarkTheme;
    final themeD =
        context.dependOnInheritedWidgetOfExactType<InheritedController>();
    return InheritedController(
      themeData: _themeData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KleineO',
        routes: routes,
        theme: themeD == null
            ? DarkTheme
            : InheritedController.of(context).themeData,
        home: Control(),
      ),
    );
  }
}
