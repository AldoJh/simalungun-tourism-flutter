import 'package:flutter/material.dart';

class ButtomHomeCustom extends StatelessWidget {
  final String? imageAssets;
  final String? label;
  final void Function()? onTap;
  final Color? backgroundColor;

  const ButtomHomeCustom(
      {super.key,
      required this.imageAssets,
      required this.label,
      this.onTap,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: backgroundColor!.withOpacity(0.2),
            child: Image.asset(
              imageAssets!,
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
