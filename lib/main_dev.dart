import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_app/app_widget.dart';
import 'package:hire_app/core/config/app_configuration.dart';
import 'package:hire_app/core/config/firebase_options.dart';
import 'package:hire_app/core/config/flavor.dart';

void main() async {
  AppConfiguration.flavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099),
  ]);

  runApp(const AppWidget());
}
