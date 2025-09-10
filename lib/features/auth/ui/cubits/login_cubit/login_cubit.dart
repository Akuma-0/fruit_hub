import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (UserEntity userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (UserEntity userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (UserEntity userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
