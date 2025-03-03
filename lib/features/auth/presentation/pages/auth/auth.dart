import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/core/widgets/divider.dart';
import 'package:x_taxi_app_client/features/auth/presentation/pages/auth/otp.dart';
import 'package:x_taxi_app_client/features/auth/presentation/pages/auth/password.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/auth_button.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/authentication_buttons.dart';

// Convert to StatefulWidget
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Add enum for auth type
  AuthType _currentAuthType = AuthType.phone;
  // Add controllers for text fields
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get isPhoneAuth => _currentAuthType == AuthType.phone;

  String get authTitle =>
      isPhoneAuth ? 'Continue with Phone' : 'Continue with Email';

  InputDecoration get authInputDecoration => isPhoneAuth
      ? textfieldDecoration.copyWith(
          prefixText: '+91 ', hintText: 'Enter your mobile number')
      : textfieldDecoration.copyWith(hintText: 'Enter your email address');

  TextInputType get authKeyboardType =>
      isPhoneAuth ? TextInputType.phone : TextInputType.emailAddress;

  TextEditingController get authController =>
      isPhoneAuth ? _phoneController : _emailController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            authTitle,
            style: headerBoldB.copyWith(fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Dynamic input field based on auth type
              Row(
                children: [
                  SvgPicture.asset(
                    isPhoneAuth
                        ? 'assets/svg/solid/india.svg'
                        : 'assets/svg/solid/email-2.svg',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 90,
                    child: TextFormField(
                      controller: authController,
                      keyboardType: authKeyboardType,
                      maxLength: isPhoneAuth ? 10 : null,
                      decoration: authInputDecoration,
                      style: textB,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              // ! button
              AuthButton(
                bgColor: Colors.black,
                onPressed: () {
                  if (isPhoneAuth) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordScreen()),
                    );
                  }
                },
                title: 'Continue',
              ),
              // ! button

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomDivider(
                  title: 'Or',
                ),
              ),

              // ! authentication buttons
              isPhoneAuth
                  ? AuthenticationButtons(
                      image: 'assets/svg/solid/email.svg',
                      title: 'Continue with Email',
                      onTap: () {
                        setState(() {
                          _emailController.clear();
                          _currentAuthType = AuthType.email;
                        });
                      },
                    )
                  : AuthenticationButtons(
                      image: 'assets/svg/solid/phone.svg',
                      title: 'Continue with Phone',
                      onTap: () {
                        setState(() {
                          _phoneController.clear();
                          _currentAuthType = AuthType.phone;
                        });
                      },
                    ),
              // Google and Apple buttons remain unchanged
              AuthenticationButtons(
                image: 'assets/svg/solid/google.svg',
                title: 'Continue with Google',
              ),
              AuthenticationButtons(
                image: 'assets/svg/solid/apple.svg',
                title: 'Continue with Apple',
              ),
              // ! authentication buttons

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomDivider(
                  title: 'Or',
                ),
              ),

              // ! find account
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/search.svg',
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Find my account',
                          style: textBoldB.copyWith(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // ! find account
              Spacer(),
              // ! info
              Text(
                isPhoneAuth
                    ? 'By proceeding you consent to get WhatsApp or SMS messages, including by automated means, from x taxi app and its affiliates to the number provided. You may opt out at any time.'
                    : 'By proceeding you consent to get Emails, including by automated means, from x taxi app and its affiliates to the email address provided. You may opt out at any time.',
                style: textB,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              // ! info
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// Define enum for authentication types
enum AuthType {
  phone,
  email,
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
        borderSide: BorderSide(color: Colors.black, width: 1.5),
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
