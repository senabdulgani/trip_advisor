import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData iconData;
  final bool isFirst;

  const LocationInput({
    super.key,
    required this.text,
    required this.iconData,
    this.onTap,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: 
          isFirst?
          const BorderRadius.vertical(
            top: Radius.circular(10),
          ):
          const BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(iconData),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: VerticalDivider(
                color: Colors.black,
                thickness: 0,
              ),
            ),
            const Text(
              'Map',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
