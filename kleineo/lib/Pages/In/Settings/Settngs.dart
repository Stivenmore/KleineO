import 'package:flutter/material.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Models/Inherited.dart';
import 'package:kleineo/Services/auth.dart';
import 'package:kleineo/Utils/ThemeData.dart';

class Settngs extends StatefulWidget {
  Settngs({Key key}) : super(key: key);

  @override
  _SettngsState createState() => _SettngsState();
}

class _SettngsState extends State<Settngs> {
  ThemeData theme;
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InheritedController(
      themeData: theme,
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.40,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/Settings.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  'Contactanos',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'KleineO@bussines.com',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'KleineO@services.com',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Whatsapp',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '+57 3234869496',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Card(
                      color: KleineoColors.lightgrey,
                      child: Column(
                        children: [
                          Center(
                            child: Text('Dark Mode'),
                          ),
                          Switch(
                              value: isDark,
                              onChanged: (value) {
                                setState(() {
                                  isDark = value;
                                  print(isDark);
                                  if (isDark == false) {
                                    theme = LightTheme;
                                    print('Is Light');
                                  } else {
                                    theme = DarkTheme;
                                    print('Is Dark');
                                  }
                                });
                              }),
                        ],
                      )),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextButton(
                    child: Text(
                      'Cerrar Sesion',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Oswald',
                          color: Color(0xffFF4F5A)),
                      textAlign: TextAlign.end,
                    ),
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
                            content: Text(
                                'Por alguna razon no podemos cerrar sesion por ahora'),
                          ),
                        );
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
