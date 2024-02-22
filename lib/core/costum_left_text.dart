import 'package:flutter/material.dart';

class CostumHeaderInLeft extends StatelessWidget {
  const CostumHeaderInLeft({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
