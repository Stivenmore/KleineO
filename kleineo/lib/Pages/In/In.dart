import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kleineo/Pages/In/Card/Cart.dart';
import 'package:kleineo/Pages/In/Home/Home.dart';
import 'package:kleineo/Pages/In/Profile/Profile.dart';
import 'package:kleineo/Pages/In/Search/Search.dart';
import 'package:kleineo/Pages/In/Settings/Settngs.dart';
import 'package:kleineo/Services/Repository.dart';

import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

class In extends StatefulWidget {
  In({Key key}) : super(key: key);

  @override
  _InState createState() => _InState();
}

class _InState extends State<In> with TickerProviderStateMixin {
  QuerySnapshot data, datas, carrito;
  Repository _repository = Repository();
  MotionTabController _tabController;
  @override
  void initState() {
    _repository.getDataGeneral((documents) {
      setState(() {
        data = documents;
      });
    });
    _repository.getDataRebajas((documents) {
      setState(() {
        datas = documents;
      });
    });
    super.initState();
    _tabController = MotionTabController(initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List datos, rebajas;
    if (data != null && datas != null) {
      datos = data.docs;
      rebajas = datas.docs;
    } else {}
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: MotionTabBar(
          labels: [
            'Home',
            'Search',
            'Profile',
          ],
          initialSelectedTab: 'Home',
          tabIconColor: Theme.of(context).primaryColor,
          tabSelectedColor: Theme.of(context).primaryColor,
          onTabItemSelected: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [
            Icons.home,
            Icons.search,
            Icons.person,
          ],
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settngs())),
              color: Theme.of(context).iconTheme.color,
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () async {
                await _repository.carrito((documents) {
                  setState(() {
                    carrito = documents;
                  });
                });
                if (carrito != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cart(
                                data: carrito,
                              )));
                } else {
                  return showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Lo sentimos, tenemos problemas con la conexion'),
                    content: Text('No te preocupes por realtime los datos persistiran'),
                  ),);
                }
              },
              color: Theme.of(context).iconTheme.color,
            )
          ],
        ),
        body: render(_tabController.index, _size, datos, rebajas));
  }

  render(opc, size, datos, rebajas) {
    switch (opc) {
      case 0:
        print(opc);
        return Container(
          height: size.height,
          width: size.width,
          child: datos == null && rebajas == null
              ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor),
                )
              : Home(
                  data: datos,
                  rebaja: rebajas,
                ),
        );
        break;
      case 1:
        print(opc);
        return Container(
          height: size.height,
          width: size.width,
          child: Search(),
        );
        break;
      case 2:
        print(opc);
        return Container(
          height: size.height,
          width: size.width,
          child: Profile(),
        );
        break;
    }
  }
}
