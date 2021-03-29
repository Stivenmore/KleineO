import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Repository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getDataGeneral(Function(QuerySnapshot documents) onState) async {
    final response = await _firestore.collection('General').get();
    onState(response);
  }

  Future getDataRebajas(Function(QuerySnapshot documents) onState) async {
    final response = await _firestore.collection('Rebajas').get();
    onState(response);
  }

  Future getDataSearch(String search) async {
    final data = await _firestore.collection(search).get();
    return data;
  }

  Future deleteCart() async {
    final resp = await _firestore.collection('Carrito').doc().id;
    return true;
  }

  Future setCarrito(
      String descripcion, String nombre, String urlImage, String precio) async {
    try {
      await _firestore.collection('Carrito').doc().set({
        'descripcion': descripcion,
        'nombre': nombre,
        'url': urlImage,
        'precio': precio
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future carrito(Function(QuerySnapshot documents) onState) async {
    final respuesta = await _firestore.collection('Carrito').get();
    onState(respuesta);
  }
}
