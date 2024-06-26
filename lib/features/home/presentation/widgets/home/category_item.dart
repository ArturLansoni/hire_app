import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      decoration: BoxDecoration(
        color: Tokens.colors.primary,
        borderRadius: BorderRadius.all(Radius.circular(Tokens.radius.normal)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: Tokens.size.ref4,
        horizontal: Tokens.size.ref3,
      ),
      child: SizedBox(
        height: Tokens.size.ref30,
        width: Tokens.size.ref50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Tokens.fontSize.ref20,
                color: Tokens.colors.background,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                icon,
                color: Tokens.colors.background,
                size: Tokens.size.ref12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
