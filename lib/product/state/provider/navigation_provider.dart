import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/search/constants.dart';

class NavigationHelper extends ChangeNotifier {
  
  Map<PolylineId, Polyline> polylines = {};
  // create marker list like polylines
  Map<MarkerId, Marker> markers = {};
  

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


  String fromController = "";
  String toController = "";
  
  
}