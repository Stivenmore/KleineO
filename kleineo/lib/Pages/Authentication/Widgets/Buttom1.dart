import 'package:flutter/material.dart';

class Buttom1 extends StatelessWidget {
  final String texto;
  final double tamanotexto;
  final Color colorContainer, colorTexto;
  const Buttom1({
    Key key,
    this.texto,
    this.colorContainer,
    this.colorTexto,
    this.tamanotexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorContainer,
      ),
      child: Center(
        child: Text(texto,
            style: TextStyle(color: colorTexto, fontSize: tamanotexto)),
      ),
      height: 55,
      width: 140,
    );
  }
}
