class Tokens {
  static const RadiusTokens radius = RadiusTokens._();
  static const SizeTokens size = SizeTokens._();
  static const FontSizeTokens fontSize = FontSizeTokens._();
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
  double get ref16 => multiplier * 16;
}

class FontSizeTokens {
  const FontSizeTokens._();

  double get ref16 => 16;
  double get ref64 => 64;
}
