import 'dart:io';

import 'package:admin/Services/Repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository _repository = Repository();
  List coleccion = [
    'Tradicional',
    'Moderno',
    'Accesorios',
    'Tecnologia',
    'Adultos',
    'Niños',
    'Rebajas'
  ];
  File image;
  String name, description, opcColeccion;
  String price;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: image == null
                ? Text('Agrega un nuevo producto')
                : metodosubir(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: () => getphoto(),
        ),
      ),
    );
  }

  Widget metodosubir() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.file(
              image,
              height: size.height * 0.40,
              width: size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Ingrese la descripcion'),
            onChanged: (value) {
              description = value;
            },
            validator: (value) {
              return value.isEmpty ? 'Es necesario una descripcion' : null;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Ingrese el nombre'),
            onChanged: (value) {
              name = value;
            },
            validator: (value) {
              return value.isEmpty
                  ? 'Es necesario un nombre del producto'
                  : null;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Ingrese el precio'),
            onChanged: (value) {
              price = value;
            },
            validator: (value) {
              return value.isEmpty
                  ? 'Es necesario un precio para el producto'
                  : null;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          DropdownButton(
            dropdownColor: Colors.grey[850],
            hint: Text('Categoria',
                style: TextStyle(
                  color: Colors.black,
                )),
            style: TextStyle(color: Colors.grey),
            value: opcColeccion,
            onChanged: (value) {
              setState(() {
                opcColeccion = value;
              });
            },
            items: coleccion.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TextButton(
              onPressed: () async {
                final resp = await _repository.setToBD(
                    image, name, description, opcColeccion, price);
                if (resp) {
                  return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Excelente :)'),
                            content:
                                Text('Lo hemos logrado guardar perfectamente'),
                          ));
                } else {
                  return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Oh rayos :('),
                            content:
                                Text(' No hemos logrado guardar, lo sentimos'),
                          ));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[850],
                ),
                height: 40,
                width: 100,
                child: Center(
                  child: Text('Guardar',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ))
        ],
      ),
    );
  }

  Future getphoto() async {
    final curremImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(curremImage.path);
    });
  }
}
