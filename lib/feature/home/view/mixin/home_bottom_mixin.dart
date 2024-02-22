import 'package:flutter/material.dart';
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
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        showModalSheet(context, const NavigationInputsBottomSheet(),isScrollControlled: true);
      } else if (index == 1) {
        showModalSheet(context, const SearchLocationScreen(),isScrollControlled: true);
      } else if (index == 2) {
        showModalSheet(context, const HubView());
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
    });
  }

  void showModalSheet(BuildContext context, Widget child, {bool? isScrollControlled}) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
      context: context,
      builder: (BuildContext context) {
        return child;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        toolbarHeight: 120,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const CostumHeaderInLeft(title: 'Route'),
            LocationInput(
              text: 'From',
              iconData: Icons.arrow_forward,
              onTap: () {
                
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const LocationInput(
              text: 'To',
              iconData: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
