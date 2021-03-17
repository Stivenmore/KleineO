import 'package:flutter/material.dart';

class DoorImage extends StatelessWidget {
  const DoorImage({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image(
      image: AssetImage('assets/image/phone_kleineO.png'),
      height: size.height / 2,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}
