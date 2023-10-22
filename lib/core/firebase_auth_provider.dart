import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:postme/core/core.dart';
import 'package:postme/core/utils.dart';

class FirebaseAuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FutureEither<User> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return right(userCredential.user!);
      } else {
        return left(const Failure('Account not created.'));
      }
    } catch (e) {
      print("Firebase Signup Error: $e");
      return left(Failure(e.toString()));
    }
  }

  Future<User?> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, e.toString());
      }
    }
  }
}
