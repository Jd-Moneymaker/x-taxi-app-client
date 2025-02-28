import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/features/home/presentation/pages/homescreen.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_state.dart';
import '../../auth/views/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            log('User logged in, navigating to HomeScreen');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          } else if (state is AuthLoggedOut) {
            log('User logged out, navigating to AuthScreen');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const AuthScreen()),
            );
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
