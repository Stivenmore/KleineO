import 'package:flutter/material.dart';
import 'package:kleineo/Services/Repository.dart';

class Home extends StatefulWidget {
  final List data, rebaja;
  const Home({
    Key key,
    @required this.data,
    @required this.rebaja,
  }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  ScrollController _scontroller;
  @override
  Widget build(BuildContext context) {
    List datos = widget.data;
    List rebajas = widget.rebaja;
    Size size = MediaQuery.of(context).size;
    double horizon = size.height * 0.40;
    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: () {},
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Text(
                  '⚡Rebajas relampago⚡',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: horizon,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 8),
                    physics: BouncingScrollPhysics(parent: ScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemCount: rebajas.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width * 0.65,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                    child: FadeInImage(
                                        fadeInCurve: Curves.ease,
                                        fit: BoxFit.cover,
                                        width: size.width * 0.60,
                                        height: size.height * 0.20,
                                        placeholder: AssetImage(
                                            'assets/gifs/infinity.gif'),
                                        image: NetworkImage(
                                            rebajas[index]['imagen']))),
                                Expanded(
                                    child: Text(
                                  rebajas[index]['nombre'],
                                  style: Theme.of(context).textTheme.headline3,
                                )),
                                Text(
                                  'Precio: ' + rebajas[index]['precio'],
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Expanded(
                                  child: Text(
                                    rebajas[index]['descripcion'],
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                    overflow: TextOverflow.fade,
                                    textDirection: TextDirection.ltr,
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              bottom: 20,
                              child: FloatingActionButton(
                                  child: Icon(Icons.shopping_bag),
                                  onPressed: () async {
                                    String descripcion =
                                        rebajas[index]['descripcion'];
                                    String nombre = rebajas[index]['nombre'];
                                    String precio = rebajas[index]['precio'];
                                    String urlImage = rebajas[index]['imagen'];
                                    final resp = await Repository().setCarrito(
                                        descripcion, nombre, urlImage, precio);
                                    if (resp == true) {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                    'Genial lo hemos agregado'),
                                                content: Text(
                                                    'Lo hemos hecho ve a tu carrio :)'),
                                              ));
                                    } else {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                    'Que mal bro'),
                                                content: Text(
                                                    'No lo hemos hecho bien :('),
                                              ));
                                    }
                                  }),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                child: Text(
                  '🔔Todo comercio🔔',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.90,
                width: size.width,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    physics: BouncingScrollPhysics(),
                    itemCount: datos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        height: size.height * 0.45,
                        child: Column(
                          children: [
                            Card(
                                child: FadeInImage(
                                    fadeInCurve: Curves.ease,
                                    fit: BoxFit.cover,
                                    width: size.width,
                                    height: size.height * 0.30,
                                    placeholder:
                                        AssetImage('assets/gifs/infinity.gif'),
                                    image:
                                        NetworkImage(datos[index]['imagen']))),
                            Expanded(
                                child: Text(
                              datos[index]['nombre'],
                              style: Theme.of(context).textTheme.headline3,
                            )),
                            Text(
                              'Precio: ' + datos[index]['precio'],
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Expanded(
                              child: Text(
                                datos[index]['descripcion'],
                                style: Theme.of(context).textTheme.headline4,
                                overflow: TextOverflow.fade,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            FloatingActionButton(
                                  child: Icon(Icons.shopping_bag),
                                  onPressed: () async {
                                    String descripcion =
                                        datos[index]['descripcion'];
                                    String nombre = datos[index]['nombre'];
                                    String precio = datos[index]['precio'];
                                    String urlImage = datos[index]['imagen'];
                                    final resp = await Repository().setCarrito(
                                        descripcion, nombre, urlImage, precio);
                                    if (resp == true) {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                    'Genial lo hemos agregado'),
                                                content: Text(
                                                    'Lo hemos hecho ve a tu carrio :)'),
                                              ));
                                    } else {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                    'Que mal bro'),
                                                content: Text(
                                                    'No lo hemos hecho bien :('),
                                              ));
                                    }
                                  }),
                           
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
