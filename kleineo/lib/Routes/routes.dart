import 'package:flutter/material.dart';
import 'package:kleineo/Pages/Authentication/Forgotd/Forgot.dart';
import 'package:kleineo/Pages/Authentication/Login/Login.dart';
import 'package:kleineo/Pages/Authentication/Register/Register.dart';

final Map<String, WidgetBuilder> routes = {
  'login'    : (BuildContext context) => Login(),
  'register' : (BuildContext context) => Register(),
  'forgot'   : (BuildContext context) => Forgot(),
};
