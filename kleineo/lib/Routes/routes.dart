import 'package:flutter/material.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Pages/Authentication/Forgotd/Forgot.dart';
import 'package:kleineo/Pages/Authentication/Login/Login.dart';
import 'package:kleineo/Pages/Authentication/Register/Register.dart';
import 'package:kleineo/Pages/In/Card/Cart.dart';
import 'package:kleineo/Pages/In/Profile/Profile.dart';
import 'package:kleineo/Pages/In/Search/Search.dart';
import 'package:kleineo/Pages/In/Settings/Settngs.dart';
import 'package:kleineo/Pages/In/In.dart';
import 'package:kleineo/main.dart';

final Map<String, WidgetBuilder> routes = {
  'login'    : (BuildContext context) => Login(),
  'register' : (BuildContext context) => Register(),
  'forgot'   : (BuildContext context) => Forgot(),
  'in'       : (BuildContext context) => In(),
  'settings' : (BuildContext context) => Settngs(),
  'profile'  : (BuildContext context) => Profile(),
  'search'   : (BuildContext context) => Search(),
  'card'     : (BuildContext context) => Cart(),
  'control'  : (BuildContext context) => Control(),
   'main'    : (BuildContext context) => MyApp()
};
