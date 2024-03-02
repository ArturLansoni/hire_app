import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/app_widget.dart';
import 'package:hire_app/core/config/app_configuration.dart';
import 'package:hire_app/core/config/firebase_options.dart';
import 'package:hire_app/core/config/flavor.dart';
import 'package:hire_app/core/utils/cubit_observer.dart';

void main() async {
  AppConfiguration.flavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CubitObserver();

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  runApp(const AppWidget());
}
