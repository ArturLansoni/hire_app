import 'package:flutter/material.dart';

extension NavigatorStateExtension on NavigatorState {
  Future<void> navigate(String routeName) async {
    await popAndPushNamed(routeName);
  }
}
