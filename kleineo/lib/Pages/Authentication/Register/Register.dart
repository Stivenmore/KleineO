import 'package:flutter/material.dart';
import 'package:kleineo/Control/Control.dart';
import 'package:kleineo/Pages/Authentication/Widgets/Buttom1.dart';
import 'package:kleineo/Pages/Authentication/Widgets/DoorImage.dart';
import 'package:kleineo/Pages/Authentication/Widgets/InputText.dart';
import 'package:kleineo/Services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

String email, password, name;

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color,),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).iconTheme.color,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DoorImage(),
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
                height: size.height * 0.01,
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
                height: size.height * 0.01,
              ),
              InputText(
                onChanged: (value) {
                  name = value;
                },
                validate: (value) =>
                    value.length < 6 ? 'Introduzca un nombre valido' : null,
                labelText: 'Nombre completo',
                helperText: 'Omar Alexis',
              ),
              GestureDetector(
                  onTap: () async{
                    print(email);
                    print(password);
                    final dynamic resp =
                       await AuthService().signUp(email, password, name);
                    if (resp == true) {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => Control(),), (route) => false);
                    } else {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                    'Lo sentimos, no pudimos completar la autenticacion :('),
                                content: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                              ));
                    }
                  },
                  child: Buttom1(
                    texto: 'Registrar',
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
