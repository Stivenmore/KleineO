import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kleineo/Services/Repository.dart';

class Search extends StatefulWidget {
  Search({
    Key key,
  }) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  int _seleIndex;
  QuerySnapshot datos;
  String search;
  List data;
  List opciones = [
    'Rebajas',
    'Moderno',
    'Adultos',
    'Accesorios',
    'Niños',
    'Tecnologia',
    'Tradicional'
  ];
  @override
  Widget build(BuildContext context) {
    Repository _repository = Repository();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(
              'Search',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.035,
              width: size.width,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: opciones.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        print(index);
                        setState(() {
                          _seleIndex = index;
                          switch (_seleIndex) {
                            case (0):
                              return search = 'Rebajas';
                              break;
                            case (1):
                              return search = 'Moderno';
                              break;
                            case (2):
                              return search = 'Adultos';
                              break;
                            case (3):
                              return search = 'Acessorios';
                              break;
                            case (4):
                              return search = 'Niños';
                              break;
                            case (5):
                              return search = 'Tecnologia';
                              break;
                            case (6):
                              return search = 'Tradicional';
                              break;
                            default:
                              return search = '';
                          }
                        });
                        print(search);
                      await _repository.getDataSearch(search).then((response) {
                          setState(() {
                            datos = response;
                            data = datos.docs;
                          });
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: _seleIndex == index
                                ? Theme.of(context).accentColor
                                : Theme.of(context).primaryColor,
                          ),
                          height: size.height * 0.04,
                          width: size.width * 0.22,
                          child: Text(
                            opciones[index],
                            style: _seleIndex == index
                                ? Theme.of(context).textTheme.headline2
                                : Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
                height: size.height*0.70,
                width: size.width*0.70,
                child: data== null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Escoge la opcion que deseas buscar',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      )
                    : SizedBox(
                        width: size.width*0.50,
                        height: size.height*0.70,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.height*0.40,
                                  width: size.width*0.50,
                                  color: Theme.of(context).cardTheme.color,
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10.0,
                                        shadowColor: Theme.of(context).primaryColor,
                                          child: FadeInImage(
                                              fadeInCurve: Curves.ease,
                                              fit: BoxFit.cover,
                                              width: size.width*0.70,
                                              height: size.height * 0.20,
                                              placeholder: AssetImage(
                                                  'assets/gifs/infinity.gif'),
                                              image: NetworkImage(
                                                  data[index]['imagen']))),
                                      Text(
                                        data[index]['nombre'],
                                        style:
                                            Theme.of(context).textTheme.headline3,
                                             textScaleFactor: 1.3,
                                             overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        'Precio: ' + datos.docs[index]['precio'],
                                        style:
                                            Theme.of(context).textTheme.headline3,
                                      ),
                                      Expanded(
                                        child: Text(
                                          data[index]['descripcion'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          overflow: TextOverflow.fade,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                ),
          ],
        ),
    ));
  }
}
