import 'package:flutter/material.dart';
import 'package:trip_advisor/core/costum_divider.dart';
import 'package:trip_advisor/core/navigation_input.dart';
import 'package:trip_advisor/feature/home/view/home_view.dart';
import '../../../../core/costum_left_text.dart';

mixin HomeBottomMixin on State<BottomNavBar> {
  int get currentIndex => _currentIndex;

  int _currentIndex = 2;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        showNavigationBottomSheet(context);
      } else if (index == 1) {
      } else if (index == 2) {
      } else if (index == 3) {
      } else if (index == 4) {
      }
    });
  }

  void showNavigationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CostumHeaderInLeft(title: 'Route'),
              LocationInput(
                text: 'From',
                iconData: Icons.arrow_forward,
              ),
              SizedBox(
                height: 10,
              ),
              LocationInput(
                text: 'To',
                iconData: Icons.arrow_back,
              ),
            ],
          ),
        );
      },
    );
  }
}
