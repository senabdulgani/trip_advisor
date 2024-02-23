import 'package:flutter/material.dart';

class BasicHelpers {
  
  static void showModalSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  } 
}