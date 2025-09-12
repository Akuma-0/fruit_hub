import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/helpers/constants/backend_endpoint.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(userEntity: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          message: 'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          message: 'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.loginWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.isDataExists(
        path: BackendEndpoint.isUserExists,
        docId: userEntity.uId,
      );
      if (isUserExists) {
        await getUserData(uId: userEntity.uId);
      } else {
        await addUserData(userEntity: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      log('Exception in AuthRepoImpl.loginWithGoogle: ${e.toString()}');
      return left(
        ServerFailure(
          message: 'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.isDataExists(
        path: BackendEndpoint.isUserExists,
        docId: userEntity.uId,
      );
      if (isUserExists) {
        await getUserData(uId: userEntity.uId);
      } else {
        await addUserData(userEntity: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      log('Exception in AuthRepoImpl.loginWithFacebook: ${e.toString()}');
      return left(
        ServerFailure(
          message: 'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await databaseService.addData(
      data: UserModel.fromEntity(userEntity).toMap(),
      path: BackendEndpoint.addUserData,
      docId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      docId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity userEntity})async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await SharedPreferencesSingleton.setString('userData', jsonData);
  }
}
