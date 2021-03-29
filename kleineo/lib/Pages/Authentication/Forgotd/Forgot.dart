import 'package:flutter/material.dart';
import 'package:kleineo/Pages/Authentication/Widgets/Buttom1.dart';
import 'package:kleineo/Pages/Authentication/Widgets/DoorImage.dart';
import 'package:kleineo/Pages/Authentication/Widgets/InputText.dart';
import 'package:kleineo/Services/auth.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

String email, password;

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).iconTheme.color
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
              Text('Por favor ingrese el correo con el cual se registro\n en nuestra App para enviarle un mensaje donde\n podra restablecer su contraseña',
              style: Theme.of(context).textTheme.headline3),
              SizedBox(height: size.height *0.02,),
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
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                  onTap: () async{
                    final dynamic resp = await AuthService().sendrespEmail(email);
                    if (resp == true) {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                    'Excelente, hemos enviado el correo', textAlign: TextAlign.center,),
                                content:  Text('Ve a tu correo, te esperamos de vuelta :)')
                              ));
                    } else {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                    'Lo sentimos, no pudimos completar el restablecimiento de tu contraseña :(', textAlign: TextAlign.center,),
                                content: Container(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black,
                                  ),
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

