import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/style/style.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_state.dart';
import '../../../widgets/auth_button.dart';
import '../../../widgets/auth_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // * text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // * text editing controllers
  // ! validation key
  final _loginFormkey = GlobalKey<FormState>();
  // ! validation key

  @override
  Widget build(BuildContext context) => Form(
        key: _loginFormkey,
        child: Column(
          children: [
            const Spacer(),
            AuthTextField(
              title: 'Email',
              hintText: 'Enter email',
              type: 'emailField',
              controller: emailController,
            ),
            AuthTextField(
              title: 'Password',
              hintText: 'Enter password',
              type: 'passwordField',
              controller: passwordController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password ? ',
                    style: textB,
                  ),
                  Text(
                    'reset',
                    style: textBoldB,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // * button
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedIn) {
                  Navigator.of(context).popAndPushNamed('/');
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('error'),
                      duration: Duration(milliseconds: 600),
                    ),
                  );
                }
              },
              // * logging in drawer item
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: AuthButton(
                    title: 'Login',
                    bgColor: Colors.black,
                    icon: Icons.arrow_forward,
                    // * button
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).emailLogIn(
                          emailController.text, passwordController.text);
                    },
                    style: textBoldW,
                  ),
                );
              },
            ),
            // * logging in drawer item
          ],
        ),
      );
}
