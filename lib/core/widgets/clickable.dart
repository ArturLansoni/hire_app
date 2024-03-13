import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class Clickable extends StatelessWidget {
  const Clickable({
    required this.child,
    required this.onTap,
    super.key,
    this.color,
    this.padding,
    this.decoration,
  });

  final Widget child;
  final void Function() onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: decoration,
      child: InkWell(
        borderRadius: BorderRadius.circular(Tokens.radius.normal),
        splashColor: Tokens.colors.background.withOpacity(0.3),
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
