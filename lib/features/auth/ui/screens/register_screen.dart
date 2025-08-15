import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/ui/cubits/register_cubit/register_cubit.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/register_screen_body_bloc_consumer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: 'حساب جديد', context: context),
        body: RegisterScreenBodyBlocConsumer(),
      ),
    );
  }
}


