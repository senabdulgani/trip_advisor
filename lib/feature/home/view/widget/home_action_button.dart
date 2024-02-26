

import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_button_mixin.dart';

class HomeActionButton extends StatefulWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  State<HomeActionButton> createState() => _HomeActionButtonState();
}

class _HomeActionButtonState extends State<HomeActionButton> with HomeActionButtonMixin {


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: goToCurrentLocation,
      child: const Icon(Icons.location_on),
    );
  }
}