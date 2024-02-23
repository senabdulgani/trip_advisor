import 'package:flutter/material.dart';
import 'package:trip_advisor/core/helper/bottom_sheet.dart';
import 'package:trip_advisor/core/navigation_input.dart';
import 'package:trip_advisor/feature/hub/hub_view.dart';
import 'package:trip_advisor/feature/home/view/home_view.dart';
import 'package:trip_advisor/feature/search/location_search_screen.dart';
import 'package:trip_advisor/feature/settings/view/settings_view.dart';
import '../../../../core/costum_left_text.dart';

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

class NavigationInputsBottomSheet extends StatelessWidget {
  const NavigationInputsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: <Widget>[
            const CostumHeaderInLeft(title: 'Route'),
            // todo Add the category services logo in future
            LocationInput(
              text: 'From',
              iconData: Icons.location_on_rounded,
              onTap: () {
                Navigator.pop(context);
                BasicHelpers.showModalSheet(
                    context, const SearchLocationScreen());
              },
              isFirst: true,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 12),
              child: Divider(
                height: 0,
                color: Colors.black,
                thickness: 0,
              ),
            ),
            const LocationInput(
              text: 'To',
              iconData: Icons.golf_course,
              isFirst: false,
            ),
          ],
        ),
      ),
    );
  }
}
