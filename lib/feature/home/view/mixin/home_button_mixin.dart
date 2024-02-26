

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_map_mixin.dart';
import 'package:trip_advisor/feature/home/view/widget/home_action_button.dart';

mixin HomeActionButtonMixin on State<HomeActionButton> {

  late GoogleMapController googleMapController;

  Future<Position> determinePosition() async {
    HomeMapMixin.permissionControl();
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  get goToCurrentLocation => _goToCurrentLocation;
  Future<void> _goToCurrentLocation() async {
    Position position = await determinePosition();
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        ),
      ),
    );
  }
}