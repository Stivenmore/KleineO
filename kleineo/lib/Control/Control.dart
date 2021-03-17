import 'package:flutter/material.dart';
import 'package:kleineo/Pages/Authentication/Door.dart';
import 'package:kleineo/Pages/Home/Home.dart';
import 'package:kleineo/Services/auth.dart';
class Control extends StatelessWidget {
  const Control({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controlX(),
    );
  }

  controlX() {
    if (AuthService().isAuth == true) {
      return Home();
    } else {
      return Door();
    }
  }
}
