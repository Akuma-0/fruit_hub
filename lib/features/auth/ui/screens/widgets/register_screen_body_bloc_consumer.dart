import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/build_error_bar.dart';
import 'package:fruit_hub/features/auth/ui/cubits/register_cubit/register_cubit.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/register_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreenBodyBlocConsumer extends StatelessWidget {
  const RegisterScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterFailure) {
          buildErrorBar(context, state.message);
        }
        if (state is RegisterSuccess) {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          child: RegisterScreenBody(),
        );
      },
    );
  }
}
