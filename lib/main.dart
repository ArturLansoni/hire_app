import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_app/app_widget.dart';
import 'package:hire_app/core/config/firebase_options.dart';
import 'package:hire_app/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjection.initialize();

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  runApp(const AppWidget());
}
