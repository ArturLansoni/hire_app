extension IntExtension on int {
  String pad() {
    return toString().padLeft(2, '0');
  }
}
