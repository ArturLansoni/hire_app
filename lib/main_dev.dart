import 'package:flutter/material.dart';
import 'package:hire_app/app_widget.dart';
import 'package:hire_app/core/config/app_configuration.dart';
import 'package:hire_app/core/config/flavor.dart';

void main() {
  AppConfiguration.baseURL = 'http://localhost:3000/dev';
  AppConfiguration.flavor = Flavor.dev;
  runApp(const AppWidget());
}
