import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/app/app.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_cubit.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationCubit()),
        ],
        child: const MyApp(),
      ),
    );
