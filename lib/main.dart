import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:x_taxi_app_client/app/app.dart';
import 'package:x_taxi_app_client/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
