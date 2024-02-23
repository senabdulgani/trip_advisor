import 'package:flutter/material.dart';

class CostumSettingItem extends StatelessWidget {
  const CostumSettingItem({
    super.key,
    required this.text,
    required this.iconData,
    this.onPressed,
  });

  final String text;
  final IconData iconData;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, size: 30),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: onPressed,
    );
  }
}