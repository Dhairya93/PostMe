import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:postme/core/failure.dart';
import 'package:postme/core/providers.dart';
import 'package:postme/core/type_defs.dart';

final authAPIProvider = Provider(
  (ref) {
    final account = ref.watch(appwriteAccountProvider);
    return AuthAPI(account: account);
  },
);

abstract class IAuthAPI {
  FutureEither<Account> signUp(
      {required String email, required String password});
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<Account> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(account as Account);
    } catch (e, stackTrace) {
      print(e);
      return left(Failure(e.toString(), stackTrace: stackTrace));
    }
  }
}
