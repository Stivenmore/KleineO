import 'package:flutter/material.dart';
import 'package:kleineo/Pages/Authentication/Widgets/Buttom1.dart';
import 'package:kleineo/Pages/Authentication/Widgets/DoorImage.dart';
import 'package:kleineo/Pages/Authentication/Widgets/InputText.dart';
import 'package:kleineo/Pages/Home/Home.dart';
import 'package:kleineo/Services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String email, password;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DoorImage(),
          SizedBox(
            height: size.height * 0.02,
          ),
          Column(
            children: [
              InputText(
                onChanged: (value) {
                  email = value;
                },
                validate: (value) =>
                    value.length < 6 ? 'Ingresa un correo valido' : null,
                labelText: 'Correo',
                helperText: 'Omar@Example.com',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              InputText(
                onChanged: (value) {
                  password = value;
                },
                validate: (value) => value.length < 6
                    ? 'Introduzca una contraseña valida'
                    : null,
                labelText: 'Contraseña',
                helperText: 'Omar******',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                  onTap: () async{
                    print(email);
                    print(password);
                    final dynamic resp = await AuthService().signIn(email, password);
                    if (resp == true) {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => Home(),), (route) => false);
                    } else {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                    'Lo sentimos, no pudimos completar la autenticacion :('),
                                content: CircularProgressIndicator(
                                    backgroundColor: Colors.black,
                                  ),
                              ));
                    }
                  },
                  child: Buttom1(
                    texto: 'Iniciar',
                    colorContainer: Colors.black,
                    colorTexto: Colors.white,
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
