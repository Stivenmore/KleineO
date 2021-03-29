import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Repository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future setToBD(File image, String name, String description,
      String opcColeccion, String price) async {
    try {
      //Aqui decimos en que carpeta guardaremos la imagen en Storage
      final response = _storage.ref().child('Post imagen');
      var timekey = DateTime.now();
      //Guardamos en Storage y obtenemos una URL
      final UploadTask uploadTask =
          response.child(timekey.toString() + '.jpg').putFile(image);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      var url = imageUrl;
      //Aqui guardamos en Cloud Firestore, que es nuestra base de datos realtime general
      final coleccion = await _firestore.collection(opcColeccion).doc().set({
        'uid'   : '',
        'nombre': name,
        'descripcion': description,
        'imagen': url,
        'precio': price
      });
      final general = await _firestore.collection('General').doc().set({
        'uid'   : '',
        'nombre': name,
        'descripcion': description,
        'imagen': url,
        'precio': price
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
