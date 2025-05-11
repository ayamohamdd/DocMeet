import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    await _updateFcmToken(userCredential.user!.uid);
    return userCredential.user!.uid;
  }

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    final String uid = userCredential.user!.uid;

    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'password': password,
      'userId': uid,
    });

    await _updateFcmToken(uid);
    return uid;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _updateFcmToken(String? id) async {
    if (id == null) return;

    final String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      await _firestore.collection('users').doc(id).update({'token': token});
    }
  }
}
