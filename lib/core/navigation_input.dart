import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({
    super.key,
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 75,
          top: 10,
          child: Icon(
            iconData,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}