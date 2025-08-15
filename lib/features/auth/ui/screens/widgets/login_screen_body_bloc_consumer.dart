import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/build_error_bar.dart';
import 'package:fruit_hub/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/login_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreenBodyBlocConsumer extends StatelessWidget {
  const LoginScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        } else if (state is LoginSuccess) {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: LoginScreenBody(),
        );
      },
    );
  }
}
