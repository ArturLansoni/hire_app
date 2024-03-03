import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/clickable.dart';

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
        color: Theme.of(context).colorScheme.primary,
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
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                icon,
                color: Colors.black,
                size: Tokens.size.ref12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
