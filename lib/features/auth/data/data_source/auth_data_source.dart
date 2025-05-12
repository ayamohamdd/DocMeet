import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quest_task/core/services/firebase_services/firebase_auth_services.dart';

abstract class AuthDataSource {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String name, String email, String password);
  // Future<void> signOut();
}

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuthServices firebaseAuthServices;

  AuthDataSourceImpl({required this.firebaseAuthServices});

  @override
  Future<String> signIn(String email, String password) async {
    final userCredential = await firebaseAuthServices.signIn(
      email: email,
      password: password,
    );
    return userCredential;
  }

  @override
  Future<String> signUp(String name, String email, String password) async {
    return await firebaseAuthServices.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  
}
