import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KleineO',
      routes: routes,
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: Control(),
    );
  }
}

