import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postme/apis/auth_api.dart';
import 'package:postme/core/utils.dart';

import '../../../core/firebase_auth_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final authControllerProviderForFirebase =
    StateNotifierProvider<AuthControllerForFirebase, bool>((ref) {
  return AuthControllerForFirebase();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);
  //state = isLoading

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    res.fold((l) => showSnackBar(context, l.message),
        (r) => print(r.get().then((value) => value.email)));
  }
}

class AuthControllerForFirebase extends StateNotifier<bool> {
  final FirebaseAuthProvider _firebaseAuth = FirebaseAuthProvider();

  AuthControllerForFirebase() : super(false);

  void signUpWithFirebase({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;

    final result = await _firebaseAuth.signUp(
        email: email, password: password, context: context);

    result.fold((l) => showSnackBar(context, l.message),
        (r) => showSnackBar(context, 'Acoount created with ${r.email}'));

    // if (result.isRight()) {
    //   showSnackBar(context, 'Account created successful.');
    // } else {
    //   showSnackBar(context, 'Account not created.');
    // }

    state = false;
  }

  void loginWithFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;

    final firebaseUser = await _firebaseAuth.signInWithEmail(
        email: email, password: password, context: context);

    if (firebaseUser != null) {
      showSnackBar(context, 'Account created successful.');
    } else {
      showSnackBar(context, 'Account not created.');
    }

    state = false;
  }
}
