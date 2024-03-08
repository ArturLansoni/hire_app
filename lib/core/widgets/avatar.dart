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

  @override
  Widget build(BuildContext context) {
    final radius = size ?? Tokens.size.ref6;
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      backgroundImage: imageURL != null ? NetworkImage(imageURL!) : null,
      child: imageURL == null
          ? Text(
              name.split(' ').map((l) => l[0]).take(2).join().toUpperCase(),
              style: TextStyle(
                fontSize: radius / 2,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
