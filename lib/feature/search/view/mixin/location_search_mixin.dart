
import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_bottom_mixin.dart';
import 'package:trip_advisor/feature/search/constants.dart';
import 'package:trip_advisor/feature/search/models/autocomplate_prediction.dart';
import 'package:trip_advisor/feature/search/models/place_auto_complate_response.dart';
import 'package:trip_advisor/product/service/network_utility.dart';

mixin LocationSearchMixin on State<NavigationInputsBottomSheet> {
  
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplate(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {
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
}