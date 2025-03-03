import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/style/style.dart';

import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // * text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // * text editing controllers
  // ! validation key
  final _signupFormKey = GlobalKey<FormState>();
  // ! validation key

  @override
  Widget build(BuildContext context) => Form(
        key: _signupFormKey,
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
              title: 'Phone',
              hintText: 'Enter number',
              type: 'phoneField',
              controller: phoneController,
            ),
            AuthTextField(
              title: 'Password',
              hintText: 'Enter password',
              type: 'passwordField',
              controller: passwordController,
            ),
            const Spacer(),
            //  * sign in button
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
                    title: 'Sign-up',
                    bgColor: Colors.black,
                    icon: Icons.arrow_forward,
                    // * button
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).emailSignUp(
                          emailController.text,
                          passwordController.text,
                          phoneController.text);
                    },
                    style: textBoldW,
                  ),
                );
              },
            ),
            // * signin button
          ],
        ),
      );
}
