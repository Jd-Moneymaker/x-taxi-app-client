import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/config/routes/route.dart';
import 'package:x_taxi_app_client/config/theme/app_themes.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';
import 'package:x_taxi_app_client/features/auth/data/data_sources/firebase_auth_api.dart';
import 'package:x_taxi_app_client/features/auth/data/repository/auth_repository_impl.dart';
import 'package:x_taxi_app_client/features/auth/domain/usecases/auth_usecase.dart';
import 'package:x_taxi_app_client/features/auth/presentation/cubit/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthCubit(
                    auth: FirebaseAuth.instance,
                    authUseCase: AuthUseCase(
                      AuthRepositoryImpl(FirebaseAuthApi()),
                    ),
                  )),
          BlocProvider(create: (_) => NavigationCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          // ? You can change this to light or dark based on user choice
          // themeMode: ThemeMode.system,
          theme: lightTheme, // Light theme
          darkTheme: darkTheme, // Dark theme
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );
}
