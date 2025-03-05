import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/auth_button.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/bottom_sheet.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Welcome back, Max',
            style: headerBoldB.copyWith(fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify with password',
                style: textB,
              ),
              SizedBox(height: 10),
              Text(
                'You previously logged in to x taxi app with a password. Would you like to continue with a password?',
                style: textB,
              ),
              SizedBox(height: 20),

              // ! password textfield
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  style: textB,
                  decoration: textfieldDecoration.copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    hintText: 'Enter password',
                  ),
                ),
              ),
              // ! password textfield

              SizedBox(height: 10),
              // ! options button
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    builder: (BuildContext context) {
                      return CustomSheet();
                    },
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'More options',
                    style: textBoldB,
                  ),
                ),
              ),
              // ! options button
              Spacer(),
              // ! button
              AuthButton(
                bgColor: Colors.black,
                onPressed: () {
                  if (passwordController.text.trim() == '123456') {
                    Navigator.of(context).pushNamed('home');
                  } else {
                    // Show error for invalid password
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid password. Use 123456'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                title: 'Continue',
              ),
              // ! button
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration get textfieldDecoration => InputDecoration(
      prefixStyle: textB,
      counterText: '',
      hintStyle: textB,
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black, width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
    );
