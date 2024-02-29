import 'package:flutter/material.dart';
import 'package:trip_advisor/core/helper/bottom_sheet.dart';
import 'package:trip_advisor/feature/hub/hub_view.dart';
import 'package:trip_advisor/feature/home/view/home_view.dart';
import 'package:trip_advisor/feature/navigation/View/navigation_inputs.dart';
import 'package:trip_advisor/feature/search/location_search_screen.dart';
import 'package:trip_advisor/feature/settings/view/settings_view.dart';

mixin HomeBottomMixin on State<BottomNavBar> {
  int get currentIndex => _currentIndex;

  int _currentIndex = 2;
  void onTabTapped(int index) {
    setState(
      () {
        _currentIndex = index;

        if (index == 0) {
          BasicHelpers.showModalSheet(
              context, const NavigationInputsBottomSheet());
        } else if (index == 1) {
          BasicHelpers.showModalSheet(context, const SearchLocationScreen());
        } else if (index == 2) {
          BasicHelpers.showModalSheet(context, const HubView());
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SettingsView();
              },
            ),
          );
        }
      },
    );
  }
}

