import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/navigation/View/navigation_inputs.dart';
import 'package:trip_advisor/feature/search/constants.dart';
import 'package:trip_advisor/feature/search/models/autocomplate_prediction.dart';
import 'package:trip_advisor/feature/search/models/place_auto_complate_response.dart';
import 'package:trip_advisor/product/service/network_utility.dart';

mixin NavigationInputsMixin on State<NavigationInputsBottomSheet> {
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplate(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  Future<Map<String, dynamic>> getCoordinates(String address) async {
    const apiKey = 'AIzaSyA68LA1UGhIl_aOO6pcCVfKGXRDfV_dKVU';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      final results = responseData['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final location = results[0]['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];
        return {'latitude': lat, 'longitude': lng};
      }
    }

    return {'latitude': 0.0, 'longitude': 0.0};
  }

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  get cameraToPosition => _cameraToPosition;
  Future<void> _cameraToPosition(String address) async {
    final coordinates = await getCoordinates(address);
    GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: LatLng(coordinates['latitude'], coordinates['longitude']),
      zoom: 13,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
}
