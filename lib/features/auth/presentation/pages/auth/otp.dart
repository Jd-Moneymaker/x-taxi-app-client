import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/auth_button.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/bottom_sheet.dart';

// Convert to StatefulWidget
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Add state variable to store OTP
  String _otpValue = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                'Verify with OTP',
                style: textB,
              ),
              SizedBox(height: 10),
              Text(
                'You previously logged in to x taxi app. Please verify your phone number to use our services. Or login using email instead.',
                style: textB,
              ),
              SizedBox(height: 20),
              //  ! otp textfield
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                // set to true to show as box or false to show as dash
                showFieldAsBox: true,
                // runs when a code is typed in
                onCodeChanged: (String code) {
                  // We can store partial codes here if needed
                  setState(() {
                    _otpValue = code;
                  });
                },
                // runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  // Store the complete OTP when all fields are filled
                  setState(() {
                    _otpValue = verificationCode;
                  });
                },
              ),
              //  ! otp textfield

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
                  // Now we can use _otpValue here
                  if (_otpValue == '696969') {
                    Navigator.of(context).pushNamed('home');
                  } else {
                    // Show error for invalid OTP
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Invalid OTP. Please use a correct otp given by administrator'),
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
