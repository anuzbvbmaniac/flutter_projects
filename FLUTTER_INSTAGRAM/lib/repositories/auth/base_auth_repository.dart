import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  // This User Getter is a listener that's constantly listening to the current state of our firebase authenticated user
  Stream<auth.User> get user;

  Future<auth.User> signUpWithEmailAndPassword({
    String username,
    String email,
    String password,
  });

  Future<auth.User> logInWithEmailAndPassword({
    String email,
    String password,
  });

  Future<void> logOut();

}
