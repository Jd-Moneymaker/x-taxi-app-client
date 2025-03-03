import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:x_taxi_app_client/config/style/style.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/auth_button.dart';
import 'package:x_taxi_app_client/features/auth/presentation/widgets/bottom_sheet.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  //! handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  // ! validation logic and submit here
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
                onPressed: () {},
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
