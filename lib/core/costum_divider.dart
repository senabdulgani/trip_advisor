import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostumDivider extends StatelessWidget {
  CostumDivider({super.key, required this.height});

  double height = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height),
        const Divider(),
        SizedBox(height: height),
      ],
    );
  }
}
