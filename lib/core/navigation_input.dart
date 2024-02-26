import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  final VoidCallback? onChanged;
  final String text;
  final IconData iconData;
  final bool isFirst;

  const LocationInput({
    super.key,
    required this.text,
    required this.iconData,
    this.onChanged,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged!();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: isFirst
            ? const UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
        contentPadding: const EdgeInsets.all(12.0),
        prefixIcon: Icon(iconData),
        hintText: text,
        hintStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
        suffixIcon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: VerticalDivider(
            color: Colors.black,
            thickness: 0,
          ),
        ),
        suffix: const Text(
          'Map',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
