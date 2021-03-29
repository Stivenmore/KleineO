import 'package:flutter/material.dart';

class ProductModel {
  var id;

  String name;
  String description;
  String imagen;
  String price;
  int quantity;

  ProductModel(
      String documentID, String name, String image, int price, int quantity);

  ProductModel.map(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['nombre'];
    this.description = obj['descripcion'];
    this.imagen = obj['imagen'];
    this.quantity = obj['quantity'];
    this.price = obj['precio'];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['id'] = id;
    map['nombre'] = name;
    map['descripcion'] = description;
    map['imagen'] = imagen;
    map['quantity'] = quantity;
    map['precio'] = price;

    return map;
  }

  ProductModel.fromMap(Map<String, dynamic> map) {
    this.description = map['descripcion'];
    this.name = map['nombre'];
    this.id = map['id'];
    this.imagen = map['imagen'];
    this.price = map['precio'];
    this.quantity = 0;
  }
}
