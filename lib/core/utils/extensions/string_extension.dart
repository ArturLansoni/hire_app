extension StringExtension on String {
  bool isValidEmail() {
    final regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(this);
  }
}
