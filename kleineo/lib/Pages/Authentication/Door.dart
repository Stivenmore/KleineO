import 'package:flutter/material.dart';
import 'package:kleineo/Pages/Authentication/Widgets/Buttom1.dart';
import 'package:kleineo/Pages/Authentication/Widgets/DoorImage.dart';
import 'package:kleineo/Routes/routes.dart';

class Door extends StatefulWidget {
  Door({Key key}) : super(key: key);

  @override
  _DoorState createState() => _DoorState();
}

class _DoorState extends State<Door> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DoorImage(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'La direccion correcta\n para ir de compras\n en internet',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Oswald'),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            '¡Ahora es muy fácil alcanzar la mejor\n calidad entre todos los productos\n en Internet!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.03,
          ), 
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'register', arguments: routes),
                      child: Buttom1(
                        texto: 'Registro',
                        tamanotexto: 18,
                        colorTexto: Colors.white,
                        colorContainer: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'login', arguments: routes),
                      child: Buttom1(
                        texto: 'Inicio',
                        tamanotexto: 18,
                        colorTexto: Colors.black,
                        colorContainer: Colors.grey[200],
                      ),
                    )
                  ],
              ),       
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'forgot', arguments: routes),
            child: Center(child: Text('Olvidaste tu contraseña?', style: TextStyle(fontSize: 16, fontFamily: 'Oswald'),)),
          )
        ],
      ),
    ));
  }
}
