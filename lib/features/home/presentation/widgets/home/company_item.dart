import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    required this.category,
    required this.name,
    required this.location,
    required this.rating,
    required this.onTap,
    super.key,
    this.imageURL,
  });

  final String category;
  final String name;
  final String location;
  final double rating;
  final String? imageURL;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      color: Tokens.colors.primary,
      padding: EdgeInsets.all(Tokens.size.ref3),
      decoration: BoxDecoration(
        color: Tokens.colors.primary,
        borderRadius: BorderRadius.circular(Tokens.radius.normal),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(imageURL: imageURL, name: name),
          SizedBox(width: Tokens.size.ref2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Tokens.colors.background,
                      fontSize: Tokens.fontSize.ref14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: Tokens.size.ref1),
                  Icon(
                    Icons.star,
                    color: Tokens.colors.background,
                    size: Tokens.size.ref3,
                  ),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Tokens.colors.background,
                      fontWeight: FontWeight.bold,
                      fontSize: Tokens.fontSize.ref10,
                    ),
                  ),
                ],
              ),
              Text(
                location,
                style: TextStyle(
                  color: Tokens.colors.background,
                  fontSize: Tokens.fontSize.ref10,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            category.toUpperCase(),
            style: TextStyle(
              color: Tokens.colors.background,
              fontSize: Tokens.fontSize.ref10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
