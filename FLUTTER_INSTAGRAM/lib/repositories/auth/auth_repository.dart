import 'package:FLUTTER_INSTAGRAM/config/paths.dart';
import 'package:FLUTTER_INSTAGRAM/models/failure_model.dart';
import 'package:FLUTTER_INSTAGRAM/repositories/auth/base_auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class AuthRepository implements BaseAuthRepository {
  final FirebaseFirestore _firebaseFirestore;
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({
    FirebaseFirestore firebaseFirestore,
    auth.FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Stream<auth.User> get user => _firebaseAuth.userChanges();

  @override
  Future<auth.User> signUpWithEmailAndPassword({
    @required String username,
    @required String email,
    @required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credentials.user;

      _firebaseFirestore.collection(Paths.users).doc(user.uid).set({
        'username': username,
        'email': email,
        'followers': 0,
        'following': 0,
      });

      return user;
    } on auth.FirebaseAuthException catch (error) {
      throw Failure(
        code: error.code,
        message: error.message,
      );
    } on PlatformException catch (error) {
      throw Failure(
        code: error.code,
        message: error.message,
      );
    }
  }

  @override
  Future<auth.User> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user;
    } on auth.FirebaseAuthException catch (error) {
      throw Failure(
        code: error.code,
        message: error.message,
      );
    } on PlatformException catch (error) {
      throw Failure(
        code: error.code,
        message: error.message,
      );
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
