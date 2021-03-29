import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kleineo/Services/Repository.dart';
import 'package:kleineo/Utils/ThemeData.dart';

class Cart extends StatefulWidget {
  final QuerySnapshot data;
  Cart({Key key, this.data}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  QuerySnapshot datatotal;
  @override
  void initState() {
    datatotal = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Repository _repository = Repository();
    Size size = MediaQuery.of(context).size;
    List data = datatotal.docs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    await _repository.deleteCart();
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                'Hemos utilizado su geolocalizacion para comprar',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Oswald',
                                    color: KleineoColors.black),
                              ),
                              content: Text(
                                  'Compra realizada con exito, se le hara el envio cuando cancele en un punto efecty\n     Num: 56416581465824'),
                            ));
                  },
                  child: Text('Ir a comprar', style: TextStyle(fontSize: 18)),
                ),
                SizedBox(
                  height: size.height * 0.92,
                  child: data.length == 0
                      ? Column(
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  'Parece que necesitamos agregar datos al carrito',
                                  style: Theme.of(context).textTheme.headline3
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: size.height,
                          child: ListView.builder(
                              padding: EdgeInsets.all(16),
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (context, index) => Container(
                                    height: size.height * 0.37,
                                    child: Card(
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            data[index]['url'],
                                            height: size.height * 0.2,
                                          ),
                                          Container(
                                              child: Text(
                                            data[index]['nombre'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          )),
                                          Container(
                                              child: Text(
                                            data[index]['descripcion'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          )),
                                          Container(
                                              child: Text(
                                            data[index]['precio'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          )),
                                          Row(
                                            children: [
                                              Text('cantidad: ', style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                              Text('2', style: Theme.of(context)
                                                .textTheme
                                                .headline3,)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
