import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future signIn(String email, password) async {
    try {
      final resp = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final token = resp.user.uid;
      print(token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getDataUser(
      Function(DocumentSnapshot userDocument) onState) async {
    await _auth.authStateChanges().listen((event) async {
      final response =
          await _firestore.collection('Users').doc(event.uid).get();
      onState(response);
    });
  }

  bool get isAuth => _auth.currentUser != null && _auth.currentUser.uid != null;

  Future signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future signUp(String email, String password, String name) async {
    try {
      final resp = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firestore
          .collection('Users')
          .doc(resp.user.uid)
          .set({'Correo': email, 'Nombre': name, 'Contraseña': password});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future sendrespEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
