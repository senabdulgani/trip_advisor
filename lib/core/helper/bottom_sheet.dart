import 'package:flutter/material.dart';

class BasicHelpers {
  
  static void showModalSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child
        );
      },
    );
  } 
}