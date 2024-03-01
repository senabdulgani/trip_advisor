import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/search/constants.dart';

class NavigationHelper extends ChangeNotifier {
  
  Map<PolylineId, Polyline> polylines = {};
  Map<MarkerId, Marker> markers = {};
  
  String fromController = "";
  String toController = "";

  Future<List<LatLng>> getPolyLinePoints(LatLng start, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      debugPrint(result.errorMessage);
    }
    return polylineCoordinates;
  }


  late GoogleMapController googleMapController;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  get mapController => _mapController;

  
  get cameraToPosition => _cameraToPosition;
  Future<void> _cameraToPosition(LatLng pos) async {
    GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
  
  Future<Position> determinePosition() async {
    permissionControl();
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  void permissionControl() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw 'Location services are disabled';
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw 'Location permission denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied';
    }
  }
  // todo Bu fonksiyon iyileştirilmeli. Kontrol mekanizması eklenmeli.
}