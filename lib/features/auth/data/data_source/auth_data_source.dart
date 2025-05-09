import 'dart:developer';

import 'package:quest_task/core/firebase_services/firebase_auth_services.dart';

abstract class AuthDataSource {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String name, String email, String password);
  Future<void> signOut();
}

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuthServices firebaseAuthServices;

  AuthDataSourceImpl({required this.firebaseAuthServices});
  @override
  Future<void> signIn(String email, String password) async {
    await firebaseAuthServices.signIn(email: email, password: password);
    log("signed in =============");
  }

  @override
  Future<void> signUp(String name, String email, String password) async {
    await firebaseAuthServices.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthServices.signOut();
  }
}
