import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn({required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    await _updateFcmToken(userCredential.user);
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'name': name,
      'email': email,
      'userId': userCredential.user!.uid,
      'role': 'user',
    }, SetOptions(merge: true));

    await _updateFcmToken(userCredential.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _updateFcmToken(User? user) async {
    if (user == null) return;

    final String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'token': token,
      });
    }
  }
}
