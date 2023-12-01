import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/app/modules/home_pages/home_page.dart';
import 'package:store/app/modules/login_pages/bloc/user_bloc/user_bloc.dart';
import 'package:store/core/status_state.dart';
import 'package:store/core/text_form.dart';
import 'package:store/themes/text_style.dart';

class LoginView extends StatelessWidget {
  static const routeName = "/LoginPage";
  LoginView({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "L O G I N",
              style: BoldText.header2,
            ),
            FormTextInput(
              label: 'Username',
              controller: usernameController,
              onChanged: (value) {
                usernameController.text = value;
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            FormSecureTextInput(
              label: 'Password',
              controller: passwordController,
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state.status == StatusState.success) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        ModalRoute.withName('/HomePage'));
                  }

                  if (state.status == StatusState.failure) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Center(
                                child: Text('Alert'),
                              ),
                              actions: [
                                OutlinedButton(
                                    onPressed: () {
                                      usernameController.clear();
                                      passwordController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close')),
                              ],
                              content: const Text('Something wrong'),
                            ));
                  }
                },
                child: Hero(
                    tag: 'hero-custom-tween',
                    createRectTween: (Rect? begin, Rect? end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    child: OutlinedButton(
                        onPressed: () {
                          if (usernameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            context.read<UserBloc>().add(UserEventLogin(
                                username: usernameController.text,
                                password: passwordController.text));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Center(
                                        child: Text('Alert'),
                                      ),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close')),
                                      ],
                                      content: const Text(
                                          'User ID dan atau Password anda belum diisi'),
                                    ));
                          }
                        },
                        child: const Text('Login'))))
          ],
        ),
      ),
    ));
  }
}
