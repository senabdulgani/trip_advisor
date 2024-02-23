
import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/search/constants.dart';
import 'package:trip_advisor/feature/search/location_search_screen.dart';
import 'package:trip_advisor/feature/search/models/autocomplate_prediction.dart';
import 'package:trip_advisor/feature/search/models/place_auto_complate_response.dart';
import 'package:trip_advisor/product/service/network_utility.dart';

mixin LocationSearchMixin on State<SearchLocationScreen> {
  
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplate(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json', // unencoder path
        {
          "input": query, // query parameter
          "key": apiKey, // make sure you add your api key
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
    // its time to make the GET request
  }
}