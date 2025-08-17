import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  Future deletUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException("لقد قمت بالتسجيل مسبقًا. الرجاء تسجيل الدخول.");
      } else if (e.code == 'network-request-failed') {
        throw CustomException("برجاء التحقق من الاتصال بالإنترنت.");
      } else if (e.code == 'invalid-email') {
        throw CustomException("البريد الإلكتروني غير صالح.");
      } else {
        throw CustomException(
          'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
      );
    }
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException('البريد الإلكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('البريد الإلكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException("برجاء التحقق من الاتصال بالإنترنت.");
      } else if (e.code == 'invalid-email') {
        throw CustomException("البريد الإلكتروني غير صالح.");
      } else {
        throw CustomException(
          'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
      );
    }
  }

  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
