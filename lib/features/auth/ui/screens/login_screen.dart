import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/login_screen_body_bloc_consumer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          title: 'تسجيل الدخول',
          isBackButtonVisible: false,
          context: context,
        ),
        body: LoginScreenBodyBlocConsumer(),
      ),
    );
  }
}
