import 'package:flutter/material.dart';

class Tokens {
  static const ColorTokens colors = ColorTokens._();
  static const SizeTokens size = SizeTokens._();
  static const RadiusTokens radius = RadiusTokens._();
  static const OpacityTokens opacity = OpacityTokens._();
  static const FontSizeTokens fontSize = FontSizeTokens._();
}

class ColorTokens {
  const ColorTokens._();
  Color get primary => const Color(0xffD0BCFF);
  Color get error => const Color(0xffB3261E);
  Color get background => const Color(0xff141218);
  Color get white => const Color(0xffffffff);
}

class RadiusTokens {
  const RadiusTokens._();
  double get normal => 8;
}

class SizeTokens {
  const SizeTokens._();
  static const multiplier = 4.0;

  double get ref1 => multiplier;
  double get ref2 => multiplier * 2;
  double get ref3 => multiplier * 3;
  double get ref4 => multiplier * 4;
  double get ref6 => multiplier * 6;
  double get ref9 => multiplier * 9;
  double get ref12 => multiplier * 12;
  double get ref16 => multiplier * 16;
  double get ref18 => multiplier * 18;
  double get ref30 => multiplier * 30;
  double get ref50 => multiplier * 50;
  double get ref60 => multiplier * 60;
}

class FontSizeTokens {
  const FontSizeTokens._();

  double get ref10 => 10;
  double get ref14 => 14;
  double get ref16 => 16;
  double get ref20 => 20;
  double get ref64 => 64;
}

class OpacityTokens {
  const OpacityTokens._();
  double get ref40 => 0.40;
}
