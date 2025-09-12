import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future addUserData({required UserEntity userEntity});
  Future saveUserData({required UserEntity userEntity});
  Future<UserEntity> getUserData({required String uId});
}
