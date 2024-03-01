import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/product/state/provider/navigation_provider.dart';

class HomeActionButton extends StatefulWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  State<HomeActionButton> createState() => _HomeActionButtonState();
}

class _HomeActionButtonState extends State<HomeActionButton> {
  late final NavigationHelper navigationProvider =
      context.read<NavigationHelper>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        navigationProvider.determinePosition().then((position) {
                  navigationProvider.cameraToPosition(
                    LatLng(position.latitude, position.longitude),
                    16,
                    0,
                  );
                });
      },
      child: const Icon(Icons.location_searching_sharp,
          color: Colors.black, size: 30),
    );
  }
}
