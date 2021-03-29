import 'package:flutter/material.dart';

class InheritedController extends InheritedWidget {
  InheritedController({this.themeData, Key key, this.child})
      : super(key: key, child: child);

  final Widget child;
  ThemeData themeData;

  static InheritedController of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<InheritedController>();
    assert(result != null, 'No hay color en contexto');
    return result;
  }

  @override
  bool updateShouldNotify(InheritedController oldWidget) {
    return oldWidget.themeData != themeData;
  }
}
