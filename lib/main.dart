import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/config/routes/route.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';
import 'package:x_taxi_app_client/features/auth/data/data_sources/firebase_auth_api.dart';
import 'package:x_taxi_app_client/features/auth/data/repository/auth_repository_impl.dart';
import 'package:x_taxi_app_client/features/auth/domain/usecases/auth_usecase.dart';
import 'package:x_taxi_app_client/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:x_taxi_app_client/features/auth/presentation/pages/splashscreen/views/splashscreen.dart';
import 'package:x_taxi_app_client/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
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
        title: 'Taxi App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const SplashScreen(),
      ),
    ),
  );
}
