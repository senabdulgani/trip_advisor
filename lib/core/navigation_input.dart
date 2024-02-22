import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  
  final Function()? onTap;
  final String text;
  final IconData iconData;

  const LocationInput({
    super.key,
    required this.text,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
        ),
        Positioned(
          left: 60,
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