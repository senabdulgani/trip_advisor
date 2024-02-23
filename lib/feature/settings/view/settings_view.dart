import 'package:flutter/material.dart';
import 'package:trip_advisor/core/costum_divider.dart';
import 'package:trip_advisor/feature/settings/components/settings_tile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            CostumDivider(
              height: 0,
            ),
            CostumSettingItem(
              iconData: Icons.translate,
              text: 'Language',
              onPressed: () {},
            ),
            CostumDivider(height: 0),
            const CostumSettingItem(
              iconData: Icons.info_outline,
              text: 'About',
            ),
            CostumDivider(height: 0),
          ],
        ),
      ),
    );
  }
}
