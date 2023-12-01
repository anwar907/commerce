import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/app/modules/login_pages/bloc/user_bloc/user_bloc.dart';
import 'package:store/app/modules/login_pages/view/login_view.dart';
import 'package:user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/LoginPage";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) =>
          UserBloc(userRepository: context.read<UserRepository>()),
      child: LoginView(),
    );
  }
}
