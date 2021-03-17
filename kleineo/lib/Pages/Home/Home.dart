import 'package:flutter/material.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Services/auth.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () async {
              final dynamic resp = await AuthService().signOut();
              if (resp) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Control(),
                    ),
                    (route) => false);
              } else {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Lo sentimos'),
                    content: Text('Por alguna razon no podemos cerrar sesion por ahora'),
                  ),
                );
              }
            }),
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontFamily: 'Oswald', fontSize: 20),
        ),
      ),
    );
  }
}
