import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/style/style.dart';

class AuthTextField extends StatefulWidget {
  final String type;
  final String title;
  final String hintText;
  final TextEditingController controller;

  final String? data;

  const AuthTextField(
      {super.key,
      required this.hintText,
      required this.type,
      required this.title,
      required this.controller,
      this.data});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  // * var to show and hide password
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'emailField':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: textBoldB,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                    controller: widget.controller,
                    style: textBoldB,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,

                    // ! validation
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.com')) {
                        return 'enter valid email';
                      }
                      return null;
                    },
                    // ! validation
                    decoration: textfieldDecoration),
              ),
            ],
          ),
        );

      // ! phone
      case 'phoneField':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: textBoldB,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                  controller: widget.controller,
                  style: textBoldB,
                  cursorColor: Colors.black,
                  // * numbers keyboard
                  keyboardType: TextInputType.number,
                  // * max length at 10 digits
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  // ! validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    } else if (value.length < 10) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                  // ! validation
                  decoration: textfieldDecoration),
            ],
          ),
        );

      // ! password
      case 'passwordField':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: textBoldB,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: widget.controller,
                style: textBoldB,
                cursorColor: Colors.black,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: _obscureText, // Toggles password visibility
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: textfieldDecoration.copyWith(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                        size: 24,
                      ),
                      tooltip: _obscureText ? 'Show Password' : 'Hide Password',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      // ! password

      // ! name
      case 'nameField':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: textBoldB,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                    controller: widget.controller,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,

                    // ! validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter valid name';
                      }
                      return null;
                    },
                    // ! validation
                    decoration: textfieldDecoration),
              ),
            ],
          ),
        );
      // ! name

      // ! bio
      case 'bioField':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: textBoldB,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child: TextFormField(
                    controller: widget.controller,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,

                    // ! validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter valid bio';
                      }
                      return null;
                    },
                    // ! validation
                    decoration: textfieldDecoration),
              ),
            ],
          ),
        );
      // ! bio

      default:
        return (const Text('error'));
    }
  }

  // textfield style
  InputDecoration get textfieldDecoration => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12), // Apply the same borderRadius here
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorBorder: InputBorder.none,
        isDense: true,
        filled: true,
        fillColor: const Color.fromARGB(18, 0, 0, 5),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        hintText: widget.hintText,
        hintStyle: textBoldB,
      );
}
