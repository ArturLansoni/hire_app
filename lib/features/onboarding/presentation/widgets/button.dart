import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class Button extends StatefulWidget {
  const Button({
    required this.label,
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Tokens.size.ref16,
      child: FilledButton(
        onPressed: widget.onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Tokens.radius.normal),
          ),
        ),
        child: widget.isLoading
            ? SizedBox(
                height: Tokens.size.ref6,
                width: Tokens.size.ref6,
                child: const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                ),
              )
            : Text(
                widget.label,
                style: TextStyle(
                  fontSize: Tokens.size.ref4,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
