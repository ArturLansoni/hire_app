import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/avatar.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    required this.name,
    required this.onTap,
    required this.finalRange,
    required this.initialRange,
    super.key,
    this.isSelected = false,
    this.imagesURL = const [],
  });

  final String name;
  final double finalRange;
  final double initialRange;
  final List<String> imagesURL;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Tokens.size.ref3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(Tokens.radius.normal),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(imageURL: imagesURL.firstOrNull, name: name),
          SizedBox(width: Tokens.size.ref2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Tokens.fontSize.ref14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'R\$ $initialRange - R\$ $finalRange',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Tokens.fontSize.ref10,
                ),
              ),
            ],
          ),
          const Spacer(),
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              onTap();
            },
          ),
        ],
      ),
    );
  }
}
