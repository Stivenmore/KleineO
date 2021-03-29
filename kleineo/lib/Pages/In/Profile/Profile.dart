import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kleineo/Services/auth.dart';

class Profile extends StatefulWidget {
  Profile({
    Key key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  DocumentSnapshot data;

  @override
  void initState() {
    AuthService().getDataUser((userDocument) {
      setState(() {
        isLoading = false;
        data = userDocument;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: render());
  }

  Widget render() {
    Size size = MediaQuery.of(context).size;
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } else {
      Map datos = data.data();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/Profile.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              'Usuario',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              datos['Nombre'],
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height*0.03,),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              'Correo',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              datos['Correo'],
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height*0.03,),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              'Contraseña',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              datos['Contraseña'],
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    }
  }
}
