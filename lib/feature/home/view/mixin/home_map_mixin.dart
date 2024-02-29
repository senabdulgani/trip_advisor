import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/feature/home/view/widget/home_map.dart';
import 'package:trip_advisor/feature/search/constants.dart';
import 'package:trip_advisor/product/state/provider/navigation_provider.dart';

mixin HomeMapMixin on State<MyMapScreen> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  get mapController => _mapController.future;

  LatLng myHome = const LatLng(39.9845136, 32.7671988);
  LatLng school = const LatLng(39.9016974, 32.779087);

  LatLng? _currentP;
  get currentP => _currentP;


  @override
  void dispose() {
    _mapController.future.then((value) => value.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    
    getLocationUpdates();
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  

  
  

  Future<void> getLocationUpdates() async {
    permissionControl();
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentP = LatLng(position.latitude, position.longitude);
      });
      _cameraToPosition(_currentP!);
    });
  }

  static void permissionControl() async {
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
