import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    required this.name,
    required this.imageURL,
    super.key,
    this.size,
  });
  final String name;
  final String? imageURL;
  final double? size;

  bool get hasImage => imageURL != null && (imageURL?.isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    final radius = size ?? Tokens.size.ref6;
    return CircleAvatar(
      radius: radius,
      backgroundColor: Tokens.colors.background,
      backgroundImage: hasImage ? NetworkImage(imageURL!) : null,
      child: !hasImage
          ? Text(
              name.split(' ').map((l) => l[0]).take(2).join().toUpperCase(),
              style: TextStyle(
                fontSize: radius / 2,
                color: Tokens.colors.white,
              ),
            )
          : null,
    );
  }
}
