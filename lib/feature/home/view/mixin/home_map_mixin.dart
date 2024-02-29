import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/home/view/widget/home_map.dart';
import 'package:trip_advisor/feature/search/constants.dart';

mixin HomeMapMixin on State<MyMapScreen> {
  
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  get mapController => _mapController.future;

  

  LatLng myHome = const LatLng(39.9845136, 32.7671988);
  LatLng school = const LatLng(39.9016974, 32.779087);

  LatLng? _currentP;
  get currentP => _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void dispose() {
    _mapController.future.then((value) => value.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => getPolyLinePoints().then(
        (coordinates) => generatePolylinesFromPoints(coordinates),
      ),
    );
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

  void generatePolylinesFromPoints(List<LatLng> coordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: await getPolyLinePoints(),
      width: 3,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(myHome.latitude, myHome.longitude),
      PointLatLng(school.latitude, school.longitude),
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
